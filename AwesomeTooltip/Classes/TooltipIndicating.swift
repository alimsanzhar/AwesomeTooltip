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
    var dismissHandler: (() -> Void)? { get }
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
