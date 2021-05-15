//
//  MainViewController.swift
//  AwesomeTooltip_Example
//
//  Created by Санжар Алим on 02.05.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import AwesomeTooltip

final class MainViewController: UIViewController {
    @IBOutlet private var showButton: UIButton!
    @IBOutlet private var hideButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: MainViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction private func showButtonPressed(_ sender: UIButton) {
        let tooltipView = TooltipView()
        tooltipView.delegate = self
        
        let configuration = TooltipConfiguration(customView: tooltipView)
        let viewController = TooltipViewController(selectedViews: [showButton, hideButton],
                                                   configuration: configuration)
        viewController.show()
    }
}

extension MainViewController: TooltipViewDelegate {
    func tooltipViewShouldClose(_ tooltipView: TooltipView) {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
}

