//
//  TooltipConfiguration.swift
//  AwesomeTooltip_Example
//
//  Created by Санжар Алим on 02.05.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import AwesomeTooltip

struct TooltipConfiguration: TooltipConfiguring {
    var customView: UIView
    
    var highlightViewModel: TooltipHighlighting = TooltipHighlightViewModel()
    var indicatorViewModel: TooltipIndicating = TooltipIndicatorViewModel()
    
    init(customView: UIView) {
        self.customView = customView
    }
}

struct TooltipHighlightViewModel: TooltipHighlighting {
    var showRoundedBackground: Bool = true
}

struct TooltipIndicatorViewModel: TooltipIndicating {
    var offset: CGFloat = 8
}
