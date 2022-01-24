//
//  Error+Report.swift
//  Foodplan
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

	func getAlert(title: String, leadingButton: AlertButton? = nil, trailingButton: AlertButton? = nil) -> Alert {
		return Alert(error: self, errorTitle: title, leadingButton: leadingButton, trailingButton: trailingButton)
	}
}
