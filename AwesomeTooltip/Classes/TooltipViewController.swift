//
//  TooltipViewController.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import UIKit

/// Overlay View Controller which represents Tooltip
public final class TooltipViewController: UIViewController {
    
    private let selectedViews: [UIView]
    private let viewModel: TooltipViewing
    
    init(selectedViews: [UIView], viewModel: TooltipViewing) {
        self.selectedViews = selectedViews
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
