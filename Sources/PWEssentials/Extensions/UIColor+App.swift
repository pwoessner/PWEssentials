//
//  UIColor+App.swift
//  PWEssentials
//
//  Created by Philipp Woessner on 08.01.22.
//

import UIKit

public extension UIColor {
	// MARK: Background
	static var appPrimaryBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.primary) ?? .systemBackground
	}

	static var appSecondaryBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.secondary) ?? .secondarySystemBackground
	}

	static var appTertiaryBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.tertiary) ?? .tertiarySystemBackground
	}

	static var appPrimaryGroupedBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.primaryGrouped) ?? .systemGroupedBackground
	}

	static var appSecondaryGroupedBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.secondaryGrouped) ?? .secondarySystemGroupedBackground
	}

	static var appTertiaryGroupedBackground: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.background.tertiaryGrouped) ?? .tertiarySystemGroupedBackground
	}

	// MARK: Text
	static var appPrimaryText: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.text.primary) ?? .label
	}

	static var appSecondaryText: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.text.secondary) ?? .secondaryLabel
	}

	static var appTertiaryText: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.text.tertiary) ?? .tertiaryLabel
	}

	// MARK: Signature
	static var appPrimarySignature: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.signature.primary) ?? .systemCyan
	}

	static var appSecondarySignature: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.signature.secondary) ?? .systemCyan
	}

	static var appPrimaryContrast: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.signature.primaryContrast) ?? .systemCyan
	}

	static var appSecondaryContrast: UIColor {
		UIColor(named: PWThemeManager.shared.currentTheme.signature.secondaryContrast) ?? .systemCyan
	}
}
