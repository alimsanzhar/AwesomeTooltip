//
//  TooltipBackgroundView.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import UIKit

final class TooltipBackgroundView: UIView {
    
    private let view: UIView
    private let configuration: TooltipHighlighting
    
    init(for view: UIView, with configuration: TooltipHighlighting) {
        self.view = view
        self.configuration = configuration
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBackground()
    }
    
    private func setupBackground() {
        backgroundColor = configuration.backgroundColor
        isHidden = !configuration.showRoundedBackground
        
        if configuration.showRoundedBackground {
            let height = max(view.frame.height, view.frame.width) + configuration.backgroundViewInset
            let widthInset = (height - view.frame.width) / 2
            layer.cornerRadius = height / 2
            
            frame = CGRect(x: view.frame.origin.x - widthInset,
                           y: view.frame.origin.y - configuration.backgroundViewInset / 2,
                           width: height,
                           height: height)
        } else {
            frame = view.frame
        }
    }
}
