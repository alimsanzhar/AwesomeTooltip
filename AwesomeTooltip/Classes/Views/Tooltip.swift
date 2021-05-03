//
//  Tooltip.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import UIKit
import AMPopTip

public enum TooltipDirection: Int {
    case up
    case down
    case left
    case right
}

final class Tooltip: NSObject {
    
    private lazy var popTip = PopTip()
    
    private let viewModel: TooltipIndicating
    
    init(viewModel: TooltipIndicating) {
        self.viewModel = viewModel
        
        super.init()
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        popTip.bubbleColor = .white
        popTip.shouldDismissOnTap = viewModel.shouldDismissOnTap
        popTip.edgeMargin = viewModel.edgeMargin
        popTip.edgeInsets = viewModel.edgeInsets
        popTip.borderWidth = viewModel.borderWidth
        popTip.borderColor = viewModel.borderColor
        popTip.shadowRadius = viewModel.shadowRadius
        popTip.shadowOpacity = viewModel.shadowOpacity
        popTip.shadowOffset = viewModel.shadowOffset
        popTip.backgroundColor = .white
        popTip.arrowSize = CGSize(width: 15, height: 8)
        popTip.padding = 0
        popTip.offset = viewModel.offset
        popTip.shouldDismissOnTapOutside = false
        popTip.entranceAnimation = .custom
        popTip.entranceAnimationHandler = { [unowned popTip] completion in
            popTip.transform = CGAffineTransform(translationX: 0, y: 10)
            popTip.alpha = 0
            UIView.animate(
                withDuration: 0.5,
                animations: {
                    popTip.transform = .identity
                    popTip.alpha = 1
                },
                completion: { _ in
                    completion()
                })
        }
        popTip.exitAnimation = .fadeOut
    }
    
    func show(customView: UIView, in view: UIView, from sourceFrame: CGRect) {
        configureHandler()
        popTip.show(customView: customView,
                    direction: PopTipDirection(direction: viewModel.direction),
                    in: view,
                    from: sourceFrame)
    }
    
    private func configureHandler() {
        if let tapHandler = viewModel.tapHandler {
            popTip.tapHandler = { _ in
                tapHandler()
            }
        }
    }
    
    func hide(forced: Bool = false) {
        popTip.exitAnimation = .fadeOut
        popTip.hide(forced: false)
    }
}

extension PopTipDirection {
    init(direction: TooltipDirection) {
        switch direction {
        case .up:
            self = .up
        case .down:
            self = .down
        case .right:
            self = .right
        case .left:
            self = .left
        }
    }
}
