//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 05.02.22.
//

import Foundation

public class PWFormatter {
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
}
