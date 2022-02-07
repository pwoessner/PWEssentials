//
//  String+Localization.swift
//  Foodplan
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation

public extension String {
	var localized: String {
		return NSLocalizedString(self, comment: self)
	}

	func localizedWith(_ param: String) -> String {
		return String(format: NSLocalizedString(self, comment: self), param)
	}
}

public extension String {
	var moduleLocalized: String {
		return NSLocalizedString(self, bundle: Bundle.module, comment: self)
	}
}
