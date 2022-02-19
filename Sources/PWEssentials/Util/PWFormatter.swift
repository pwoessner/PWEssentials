//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 05.02.22.
//

import Foundation

public class PWFormatter {
	public static func formatDate(date: Date, dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .none) -> String {
		let formatter = DateFormatter()

		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle

		return formatter.string(from: date)
	}

	public static func formatTime(interval: TimeInterval, unitStyle: DateComponentsFormatter.UnitsStyle = .abbreviated) -> String {
		let formatter = DateComponentsFormatter()

		formatter.allowedUnits = [.minute]
		formatter.unitsStyle = unitStyle
		formatter.zeroFormattingBehavior = .pad

		if interval / 60 > 60 {
			formatter.allowedUnits.insert(.hour)
		}

		return formatter.string(from: interval) ?? "NaN"
	}

	public static func formatUnitSymbol(for unit: Unit, style: Formatter.UnitStyle) -> String {
		let formatter = MeasurementFormatter()
		formatter.unitStyle = style
		return formatter.string(fromCustom: unit)
	}
}
