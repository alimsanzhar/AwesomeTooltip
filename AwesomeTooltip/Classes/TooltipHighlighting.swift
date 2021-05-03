//
//  TooltipHighlighting.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 29.04.2021.
//

import UIKit

public protocol TooltipHighlighting {
    var isSelectable: Bool { get }
}

public extension TooltipHighlighting {
    var isSelectable: Bool {
        true
    }
}
