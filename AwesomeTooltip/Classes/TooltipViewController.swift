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
    private let tooltipWasClosed: () -> Void
    
    /// - Parameters:
    ///   - selectedViews: Views to be highlighted
    ///   - configuration: Configuration to design tooltip
    init(selectedViews: [UIView],
         configuration: TooltipConfiguring,
         tooltipWasClosed: @escaping () -> Void) {
        self.selectedViews = selectedViews
        self.configuration = configuration
        self.highlightingViewModel = configuration.highlightingViewModel
        self.tooltip = Tooltip(viewModel: configuration.indicatingViewModel)
        self.tooltipWasClosed = tooltipWasClosed
        
        super.init(nibName: nil, bundle: nil)
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
        snapshots = selectedViews.map { view in
            let snapshotImageView = UIImageView()
            snapshotImageView.image = view.snapshot
            snapshotImageView.frame = view.convert(view.bounds, to: self.view.superview)
            
            return snapshotImageView
        }
    }
    
    private func setupSnapshotsDetails() {
        snapshots.enumerated().forEach { index, view in
            let hitTestView = TooltipHitTestView(targetView: selectedViews[index], delegate: self)
            let backgroundView = TooltipBackgroundView(for: selectedViews[index],
                                                       with: configuration.highlightingViewModel)
            
            backgroundViews.append(backgroundView)
            
            self.view.addSubview(view)
            self.view.insertSubview(hitTestView, belowSubview: view)
            self.view.insertSubview(backgroundView, belowSubview: hitTestView)
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showTooltip()
    }
    
    private func showTooltip() {
        guard let backgroundView = backgroundViews.last else { return }
        
        tooltip.show(customView: configuration.customView, in: view, from: backgroundView.frame)
    }
    
    func show() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController,
              rootViewController.presentedViewController == nil else { return }
        
        rootViewController.present(self, animated: true)
    }
}

extension TooltipViewController: TooltipHitTestViewDelegate {
    func tooltipHitTestViewDidTap(_ tooltipHitTestView: TooltipHitTestView) {
        //
    }
}
