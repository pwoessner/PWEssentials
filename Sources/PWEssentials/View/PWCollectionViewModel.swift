//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

open class CollectionViewModel<SectionType> {
	@Published public var reconfigureItems: [UUID] = []

	public let sections: [CollectionSection<SectionType>]

	public init(sections: [CollectionSection<SectionType>]) {
		self.sections = sections
	}

	open func getSection(for itemIdentifier: UUID) -> CollectionSection<SectionType>? {
		for section in sections where section.itemIdentifiers.contains(itemIdentifier) {
			return section
		}
		return nil
	}

	open func finishReconfiguration() {
		reconfigureItems.removeAll()
	}
}
