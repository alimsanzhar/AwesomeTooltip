//
//  UIView+Snapshot.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 01.05.2021.
//

import Foundation

extension UIView {
    /// Returns a snapshot of specific view
    var snapshot: UIImage? {
        UIGraphicsImageRenderer(size: bounds.size).image { context in
            layer.render(in: context.cgContext)
        }
    }
}
