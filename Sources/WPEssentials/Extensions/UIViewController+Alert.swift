//
//  UIViewController+Alert.swift
//  Foodplan
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation
import UIKit

extension UIViewController {
	func presentAlert(_ alert: Alert) {
		let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: alert.style)

		if let leadingButton = alert.leadingButton {
			let leadingAction = UIAlertAction(title: leadingButton.title, style: leadingButton.style) { _ in
				leadingButton.action?()
			}
			alertController.addAction(leadingAction)
		}

		if let trailingButton = alert.trailingButton {
			let trailingAction = UIAlertAction(title: trailingButton.title, style: trailingButton.style) { _ in
				trailingButton.action?()
			}
			alertController.addAction(trailingAction)
		}

		self.present(alertController, animated: true)
	}
}
