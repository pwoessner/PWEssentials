//
//  PWCollectionCache.swift.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

class CollectionCache<SectionType, DataType: Identifiable & Hashable> {
	var type: SectionType
	private(set) var data: [DataType.ID: DataType]

	init(type: SectionType, data: [DataType.ID: DataType] = [:]) {
		self.type = type
		self.data = data
	}

	func updateData(_ dataUpdate: [DataType]) -> [DataType.ID] {
		var changedIds: [DataType.ID] = []
		for newData in dataUpdate {
			if let oldData = data[newData.id], oldData != newData {
				changedIds.append(newData.id)
			}
			data[newData.id] = newData
		}
		return changedIds
	}

	func setData(_ dataUpdate: [DataType]) {
		data.removeAll()
		for newData in dataUpdate {
			self.data[newData.id] = newData
		}
	}
}
