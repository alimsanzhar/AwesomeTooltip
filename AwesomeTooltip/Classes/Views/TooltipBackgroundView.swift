//
//  TooltipBackgroundView.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import UIKit

final class TooltipBackgroundView: UIView {
    
    private let view: UIView
    private let viewModel: TooltipHighlighting
    
    init(for view: UIView, with viewModel: TooltipHighlighting) {
        self.view = view
        self.viewModel = viewModel
        
        super.init(frame: Self.frame(for: view, with: viewModel))
        
        backgroundColor = viewModel.backgroundColor
        isHidden = !viewModel.showRoundedBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func frame(for view: UIView, with viewModel: TooltipHighlighting) -> CGRect {
        if viewModel.showRoundedBackground {
            let height = max(view.frame.height, view.frame.width) + viewModel.backgroundViewInset
            let widthInset = (height - view.frame.width) / 2
            
            return CGRect(x: view.frame.origin.x - widthInset,
                          y: view.frame.origin.y - height / 2,
                          width: height,
                          height: height)
        }
        
        return view.frame
    }
}
