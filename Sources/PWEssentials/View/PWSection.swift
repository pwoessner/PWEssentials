//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation
import Combine

open class PWCollectionSection<SectionType> {
	open var type: SectionType
	@Published open var itemIdentifiers: [UUID]

	let headerText: String?
	let footerText: String?

	public init(type: SectionType,
				itemIdentifiers: [UUID] = [],
				headerText: String? = nil,
				footerText: String? = nil) {
		self.type = type
		self.itemIdentifiers = itemIdentifiers

		self.headerText = headerText
		self.footerText = footerText
	}
}

open class PWViewSection<SectionType, CellType: Identifiable & Hashable>: Identifiable, ObservableObject {
	open var type: SectionType
	@Published open var cells: [CellType]

	public var headerText: String?
	public var footerText: String?

	public init(type: SectionType,
				cells: [CellType] = [],
				headerText: String? = nil,
				footerText: String? = nil) {
		self.type = type
		self.cells = cells

		self.headerText = headerText
		self.footerText = footerText
	}
}
