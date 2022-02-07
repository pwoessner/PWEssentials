//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

open class PWCollectionViewModel<SectionType> {
	@Published public var reconfigureItems: [UUID] = []

	public let sections: [PWCollectionSection<SectionType>]

	public init(sections: [PWCollectionSection<SectionType>]) {
		self.sections = sections
	}

	open func getSection(for itemIdentifier: UUID) -> PWCollectionSection<SectionType>? {
		for section in sections where section.itemIdentifiers.contains(itemIdentifier) {
			return section
		}
		return nil
	}

	open func prepareReconfiguration() {
		reconfigureItems.removeAll()
	}
}
