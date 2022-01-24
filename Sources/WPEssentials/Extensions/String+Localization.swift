//
//  String+Localization.swift
//  Foodplan
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: self)
	}

	func localizedWith(_ param: String) -> String {
		return String(format: NSLocalizedString(self, comment: self), param)
	}
}
