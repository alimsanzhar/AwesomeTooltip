//
//  TooltipHighlighting.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import Foundation

public protocol TooltipHighlighting {
    var buttonTitle: String { get }
    var message: String { get }
    var direction: String { get }
    var showRoundedBackground: Bool { get }
}

extension TooltipHighlighting {
    var showRoundedBackground: Bool {
        true
    }
}
