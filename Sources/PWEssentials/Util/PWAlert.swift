//
//  Alert.swift
//  Foodplan
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation
import UIKit

public typealias ButtonAction = (() -> Void)

public struct AlertButton {
	let title: String
	let action: ButtonAction?
	let style: UIAlertAction.Style
}

public class PWAlert {
	let title: String
	let message: String
	let style = UIAlertController.Style.alert
	let leadingButton: AlertButton?
	let trailingButton: AlertButton?

	init(title: String, message: String, leadingButton: AlertButton? = nil, trailingButton: AlertButton? = nil) {
		self.title = title
		self.message = message
		self.leadingButton = leadingButton
		self.trailingButton = trailingButton
	}

	init(error: Error, errorTitle: String, leadingButton: AlertButton? = nil, trailingButton: AlertButton? = nil) {
		self.title = errorTitle
		self.message = error.localizedDescription
		self.leadingButton = leadingButton
		self.trailingButton = trailingButton
	}
}
