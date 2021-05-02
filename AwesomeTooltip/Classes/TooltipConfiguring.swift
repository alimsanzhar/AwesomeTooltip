//
//  TooltipConfiguring.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import Foundation

public protocol TooltipConfiguring {
    var customView: UIView { get }
    var highlightingViewModel: TooltipHighlighting { get }
    var indicatingViewModel: TooltipIndicating { get }
}
