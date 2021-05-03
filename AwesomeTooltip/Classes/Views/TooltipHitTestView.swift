//
//  TooltipHitTestView.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import UIKit

protocol TooltipHitTestViewDelegate: AnyObject {
    func tooltipHitTestViewDidTap(_ tooltipHitTestView: TooltipHitTestView)
}

/// An area that is responsible for skipping the click through the view
final class TooltipHitTestView: UIView {
    private let targetView: UIView
    private weak var delegate: TooltipHitTestViewDelegate?
    
    /// - Parameters:
    ///   - targetView: View that has to receive a hit
    ///   - delegate: Delegate that processes the hit
    init(frame: CGRect, targetView: UIView, delegate: TooltipHitTestViewDelegate?) {
        self.targetView = targetView
        self.delegate = delegate
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if super.hitTest(point, with: event) === self {
            delegate?.tooltipHitTestViewDidTap(self)
            
            return targetView.hitTest(point, with: event)
        }
        
        return nil
    }
}
