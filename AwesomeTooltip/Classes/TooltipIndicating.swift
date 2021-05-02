//
//  TooltipIndicating.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import Foundation

public protocol TooltipIndicating {
    //TODO: Setup default behaviour
    var offset: CGFloat { get }
    var tapHandler: (() -> Void)? { get }
    var direction: TooltipDirection { get }
    
    var shouldDismissOnTap: Bool { get }
    var edgeMargin: CGFloat { get }
    var edgeInsets: UIEdgeInsets { get }
    var borderWidth: CGFloat { get }
    var borderColor: UIColor { get }
    var shadowRadius: Float { get }
    var shadowOpacity: Float { get }
    var shadowOffset: CGSize { get }
}

public extension TooltipIndicating {
    var offset: CGFloat {
        0
    }
    
    var tapHandler: (() -> Void)? {
        nil
    }
    
    var direction: TooltipDirection {
        .down
    }
    
    var shouldDismissOnTap: Bool {
        true
    }
    
    var edgeMargin: CGFloat {
        5
    }
    
    var edgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 12, bottom: 12, right: 12)
    }
    
    var borderWidth: CGFloat {
        0
    }
    
    var borderColor: UIColor {
        .clear
    }
    
    var shadowRadius: Float {
        0
    }
    
    var shadowOpacity: Float {
        0
    }
    
    var shadowOffset: CGSize {
        CGSize(width: 0, height: 0)
    }
}
