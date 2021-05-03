//
//  TooltipViewController.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import UIKit

/// Overlay View Controller which represents Tooltip
public final class TooltipViewController: UIViewController {
    
    private var snapshots: [UIImageView] = []
    private var backgroundViews: [UIView] = []
    
    private let selectedViews: [UIView]
    private let configuration: TooltipConfiguring
    private let highlightingViewModel: TooltipHighlighting
    private let tooltip: Tooltip
    
    /// - Parameters:
    ///   - selectedViews: Views to be highlighted
    ///   - configuration: Configuration to design tooltip
    public init(selectedViews: [UIView], configuration: TooltipConfiguring) {
        self.selectedViews = selectedViews
        self.configuration = configuration
        self.highlightingViewModel = configuration.highlightingViewModel
        self.tooltip = Tooltip(viewModel: configuration.indicatingViewModel)
        
        super.init(nibName: String(describing: TooltipViewController.self),
                   bundle: AwesomeTooltipBundle.shared)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        configureSnapshots()
        setupSnapshotsDetails()
    }
    
    private func configureSnapshots() {
        snapshots = selectedViews.map {
            let snapshotImageView = UIImageView()
            snapshotImageView.image = $0.snapshot
            snapshotImageView.frame = $0.convert($0.bounds, to: view.superview)
            
            return snapshotImageView
        }
    }
    
    private func setupSnapshotsDetails() {
        snapshots.enumerated().forEach { index, snapshotView in
            let hitTestView = TooltipHitTestView(frame: snapshotView.frame,
                                                 targetView: selectedViews[index],
                                                 delegate: self)

            view.addSubview(snapshotView)
            view.insertSubview(hitTestView, belowSubview: snapshotView)
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showTooltip()
    }
    
    private func showTooltip() {
        guard let snapshot = snapshots.last else { return }
        
        tooltip.show(customView: configuration.customView, in: view, from: snapshot.frame)
    }
    
    public func show() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController,
              rootViewController.presentedViewController == nil else { return }
        
        rootViewController.present(self, animated: true)
    }
}

extension TooltipViewController: TooltipHitTestViewDelegate {
    func tooltipHitTestViewDidTap(_ tooltipHitTestView: TooltipHitTestView) {
        if !configuration.highlightingViewModel.isSelectable {
            return
        }
        
        dismiss(animated: false, completion: nil)
    }
}
