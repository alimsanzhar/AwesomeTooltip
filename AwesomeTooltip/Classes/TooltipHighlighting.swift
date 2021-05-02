//
//  TooltipHighlighting.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import UIKit

public protocol TooltipHighlighting {
    var isSelectable: Bool { get }
    var showRoundedBackground: Bool { get }
    var backgroundColor: UIColor { get }
    var backgroundViewInset: CGFloat { get }
}

public extension TooltipHighlighting {
    var isSelectable: Bool {
        true
    }
    
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
