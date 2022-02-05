//
//  Theming.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation

public protocol PWTheme {
	var primary: String { get }
	var secondary: String { get }
	var tertiary: String { get }
	var quarternary: String { get }

	var background: String { get }
	var tableBackground: String { get }
	var cellBackground: String { get }

	var primaryTint: String { get }
	var secondaryTint: String { get }
	var tertiaryTint: String { get }
}

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

struct PWDefaultTheme: PWTheme {
	private(set) var primary: String = "Primary"
	private(set) var secondary: String = "Secondary"
	private(set) var tertiary: String = "Tertiary"
	private(set) var quarternary: String = "Quarternary"
	private(set) var background: String = "Background"
	private(set) var tableBackground: String = "TableBackground"
	private(set) var cellBackground: String = "CellBackground"
	private(set) var primaryTint: String = "PrimaryTint"
	private(set) var secondaryTint: String = "SecondaryTint"
	private(set) var tertiaryTint: String = "TertiaryTint"

	init () {}
}
