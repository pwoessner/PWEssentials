//
//  Error+Report.swift
//  PWEssentials
//
//  Created by Philipp Woessner on 08.01.22.
//

import Foundation
import Logging

let errorLogger = Logger(label: "Error")

public extension Error {
	func log(_ caller: Any) {
		errorLogger.error("\(String(describing: caller)): [\(self)] \(self.localizedDescription)")
	}

	func getAlert(title: String, message: String? = nil, leadingButton: PWAlertButton? = nil, trailingButton: PWAlertButton? = nil) -> PWAlert {
		return PWAlert(error: self, errorTitle: title, errorMessage: message, leadingButton: leadingButton, trailingButton: trailingButton)
	}
}
