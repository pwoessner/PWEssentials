//
//  Date+Convenience.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation

extension Date {
	func getDate(in days: Int, _ component: Calendar.Component) -> Date {
		Calendar.current.date(byAdding: component, value: days, to: self) ?? Date()
	}

	static var today: Date {
		Calendar.current.startOfDay(for: Date())
	}
}
