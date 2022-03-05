//
//  Alert.swift
//  PWEssentials
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation
import UIKit

public typealias ButtonAction = (() -> Void)

public struct PWAlertButton {
	let title: String
	let action: ButtonAction?
	let style: UIAlertAction.Style

	public init(title: String, action: ButtonAction? = nil, style: UIAlertAction.Style = .default) {
		self.title = title
		self.action = action
		self.style = style
	}

	public static var generalOkButton: PWAlertButton {
		PWAlertButton(title: PWEssentialsStrings.General.ok)
	}
}

public class PWAlert {
	let title: String
	let message: String
	let style = UIAlertController.Style.alert
	let leadingButton: PWAlertButton?
	let trailingButton: PWAlertButton?

	init(title: String, message: String, leadingButton: PWAlertButton? = nil, trailingButton: PWAlertButton? = nil) {
		self.title = title
		self.message = message
		self.leadingButton = leadingButton
		self.trailingButton = trailingButton
	}

	init(error: Error, errorTitle: String, errorMessage: String? = nil, leadingButton: PWAlertButton? = nil, trailingButton: PWAlertButton? = nil) {
		self.title = errorTitle
		self.message = errorMessage ?? error.localizedDescription
		self.leadingButton = leadingButton
		self.trailingButton = trailingButton
	}
}
