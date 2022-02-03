//
//  UIStackView+Subviews.swift
//  iPhone
//
//  Created by Woessner, Philipp on 13.06.20.
//  Copyright © 2020 Woessner. All rights reserved.
//

import Foundation
import UIKit

public extension UIStackView {

    func removeAllArrangedSubviews() {

        let removedSubviews = arrangedSubviews.reduce([]) { allSubviews, subview -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }

        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))

        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
