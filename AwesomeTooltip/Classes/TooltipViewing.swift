//
//  TooltipViewing.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import Foundation

public protocol TooltipViewing {
    var buttonTitle: String { get }
    var message: String { get }
    var direction: String { get }
    var showRoundedBackground: Bool { get }
}

extension TooltipViewing {
    var showRoundedBackground: Bool {
        true
    }
}
