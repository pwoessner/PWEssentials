//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

open class CollectionSection<SectionType> {
	open var type: SectionType
	open var itemIdentifiers: [UUID]

	public init(type: SectionType, itemIdentifiers: [UUID] = []) {
		self.type = type
		self.itemIdentifiers = itemIdentifiers
	}
}
