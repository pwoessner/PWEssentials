//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

class CollectionViewModel<SectionType> {
	@Published var reconfigureItems: [UUID] = []

	let sections: [CollectionSection<SectionType>]

	init(sections: [CollectionSection<SectionType>]) {
		self.sections = sections
	}

	func getSection(for itemIdentifier: UUID) -> CollectionSection<SectionType>? {
		for section in sections where section.itemIdentifiers.contains(itemIdentifier) {
			return section
		}
		return nil
	}

	func finishReconfiguration() {
		reconfigureItems.removeAll()
	}
}
