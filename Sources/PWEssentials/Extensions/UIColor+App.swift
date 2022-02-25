//
//  UIColor+App.swift
//  Foodplan
//
//  Created by Philipp Woessner on 08.01.22.
//

import UIKit
import SwiftUI

public extension UIColor {
	// MARK: App Colors
	static var appPrimary: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.primary) ?? .systemGreen
	}

	static var appSecondary: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.secondary) ?? .systemGreen
	}

	static var appTertiary: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.tertiary) ?? .systemGreen
	}

	static var appQuarternary: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.quarternary) ?? .systemGreen
	}

	// MARK: Background Colors
	static var appBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background) ?? .systemBackground
	}

	static var appTableBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.tableBackground) ?? .systemGroupedBackground
	}

	static var appCellBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.cellBackground) ?? .secondarySystemGroupedBackground
	}

	// MARK: Tint Colors
	static var appPrimaryTint: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.primaryTint) ?? .label
	}

	static var appSecondaryTint: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.secondaryTint) ?? .secondaryLabel
	}

	static var appTertiaryTint: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.tertiaryTint) ?? .tertiaryLabel
	}
}

public extension Color {
	// MARK: App Colors
	static var appPrimary: Color {
		Color(UIColor.appPrimary)
	}

	static var appSecondary: Color {
		Color(UIColor.appSecondary)
	}

	static var appTertiary: Color {
		Color(UIColor.appTertiary)
	}

	static var appQuarternary: Color {
		Color(UIColor.appQuarternary)
	}

	// MARK: Background Colors
	static var appBackground: Color {
		Color(UIColor.appBackground)
	}

	static var appTableBackground: Color {
		Color(UIColor.appTableBackground)
	}

	static var appCellBackground: Color {
		Color(UIColor.appCellBackground)
	}

	// MARK: Tint Colors
	static var appPrimaryTint: Color {
		Color(UIColor.appPrimaryTint)
	}

	static var appSecondaryTint: Color {
		Color(UIColor.appSecondaryTint)
	}

	static var appTertiaryTint: Color {
		Color(UIColor.appTertiaryTint)
	}
}
