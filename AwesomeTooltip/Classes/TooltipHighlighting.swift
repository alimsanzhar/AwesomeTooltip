//
//  TooltipHighlighting.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import UIKit

public protocol TooltipHighlighting {
//    var buttonTitle: String { get }
//    var message: String { get }
//    var direction: String { get }
    var showRoundedBackground: Bool { get }
    var backgroundColor: UIColor { get }
    var backgroundViewInset: CGFloat { get }
}

extension TooltipHighlighting {
    var showRoundedBackground: Bool {
        true
    }
    
    var backgroundColor: UIColor {
        .white
    }
    
    var backgroundViewInset: CGFloat {
        40
    }
}
