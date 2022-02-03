//
//  UIFont+Convenience.swift
//  iPhone
//
//  Created by Woessner, Philipp on 13.06.20.
//  Copyright © 2020 Woessner. All rights reserved.
//

import Foundation
import UIKit

public extension UIFont {
    static func preferredFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
