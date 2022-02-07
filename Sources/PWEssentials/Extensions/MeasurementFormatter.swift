//
//  MeasurementFormatter.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 07.02.22.
//

import Foundation

extension MeasurementFormatter {
	func string(fromCustom unit: Unit) -> String {
		if unit is UnitItem {
			switch self.unitStyle {
			case .short:
				return unit.symbol.localized
			default:
				return "\(unit.symbol)_long".localized
			}
		}

		return string(from: unit)
	}
}
