//
//  Theming.swift
//  PWEssentials
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation

open class PWThemeManager {
	public static var shared = PWThemeManager()

	open private(set) var currentTheme: PWTheme

	private init() {
		self.currentTheme = PWDefaultTheme()
	}

	func set(theme: PWTheme) {
		self.currentTheme = theme
	}
}

public protocol PWTheme {
	var background: BackgroundColors { get }
	var text: TextColors { get }
	var signature: SignatureColors { get }
}

public struct BackgroundColors {
	var primary: String
	var secondary: String
	var tertiary: String

	var primaryGrouped: String
	var secondaryGrouped: String
	var tertiaryGrouped: String
}

public struct TextColors {
	var primary: String
	var secondary: String
	var tertiary: String
}

public struct SignatureColors {
	var primary: String
	var secondary: String
	var primaryContrast: String
	var secondaryContrast: String
}

struct PWDefaultTheme: PWTheme {
	let background = BackgroundColors(primary: "PrimaryBackground",
									  secondary: "SecondaryBackground",
									  tertiary: "TertiaryBackground",
									  primaryGrouped: "PrimaryGroupedBackground",
									  secondaryGrouped: "SecondaryGroupedBackground",
									  tertiaryGrouped: "TertiaryGroupedBackground")
	let text = TextColors(primary: "PrimaryText",
						  secondary: "SecondaryText",
						  tertiary: "TertiaryText")
	let signature = SignatureColors(primary: "PrimarySignature",
									secondary: "SecondarySignature",
									primaryContrast: "PrimaryContrast",
									secondaryContrast: "SecondaryContrast")
}
