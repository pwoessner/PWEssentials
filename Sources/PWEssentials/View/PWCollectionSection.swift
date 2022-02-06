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

	public init(type: SectionType, itemIdentifiers: [UUID] = []) {
		self.type = type
		self.itemIdentifiers = itemIdentifiers
	}
}
