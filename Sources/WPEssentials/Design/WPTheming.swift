//
//  Theming.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation

public protocol WPTheme {
	var primary: String { get }
	var secondary: String { get }
	var tertiary: String { get }
	var quarternary: String { get }

	var background: String { get }
	var tableBackground: String { get }
	var cellBackground: String { get }

	var primaryTint: String { get }
	var secondaryTint: String { get }
}

open class WPThemeManager {
	public static var shared = WPThemeManager()

	open private(set) var currentTheme: WPTheme

	private init() {
		self.currentTheme = WPDefaultTheme()
	}

	func set(theme: WPTheme) {
		self.currentTheme = theme
	}
}

struct WPDefaultTheme: WPTheme {
	private(set) var primary: String = "Primary"
	private(set) var secondary: String = "Secondary"
	private(set) var tertiary: String = "Tertiary"
	private(set) var quarternary: String = "Quarternary"
	private(set) var background: String = "Background"
	private(set) var tableBackground: String = "TableBackground"
	private(set) var cellBackground: String = "CellBackground"
	private(set) var primaryTint: String = "PrimaryTint"
	private(set) var secondaryTint: String = "SecondaryTint"

	init () {}
}
