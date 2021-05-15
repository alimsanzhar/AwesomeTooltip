//
//  AwesomeTooltipBundle.swift
//  AwesomeTooltip
//
//  Created by Санжар Алим on 02.05.2021.
//

import Foundation

final class AwesomeTooltipBundle: NSObject {
    private static let bundleName = "AwesomeTooltip"
    private static let bundleExtension = "bundle"
    
    public static let shared = AwesomeTooltipBundle.bundle()
    
    private static func bundle() -> Bundle? {
        if let url = Bundle.main.url(forResource: bundleName, withExtension: bundleExtension) {
            return Bundle(url: url)
        } else if let url = Bundle(for: AwesomeTooltipBundle.classForCoder()).url(forResource: bundleName,
                                                                       withExtension: bundleExtension) {
            return Bundle(url: url)
        }
        
        return Bundle(for: AwesomeTooltipBundle.classForCoder())
    }
}
