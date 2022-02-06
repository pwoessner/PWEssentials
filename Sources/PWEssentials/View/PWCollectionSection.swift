//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

class CollectionSection<SectionType> {
	var type: SectionType
	var itemIdentifiers: [UUID]

	init(type: SectionType, itemIdentifiers: [UUID] = []) {
		self.type = type
		self.itemIdentifiers = itemIdentifiers
	}
}
