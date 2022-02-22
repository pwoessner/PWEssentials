//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation
import Combine

open class PWCollectionViewModel<SectionType> {
	public var isLoading = PassthroughSubject<Bool, Never>()
	public var currentError = PassthroughSubject<Error, Never>()

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

open class PWViewModel<SectionType, CellType: Identifiable & Hashable> {
	public var isLoading = PassthroughSubject<Bool, Never>()
	public var currentError = PassthroughSubject<Error, Never>()
	
	public let sections: [PWViewSection<SectionType, CellType>]

	public init(sections: [PWViewSection<SectionType, CellType>]) {
		self.sections = sections
	}
}
