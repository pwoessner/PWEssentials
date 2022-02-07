//
//  PWCollectionCache.swift.swift
//  
//
//  Created by Woessner, Philipp on 06.02.22.
//

import Foundation

open class PWCollectionCache<DataType: Identifiable & Hashable> {
	public private(set) var data: [DataType.ID: DataType]

	public init(data: [DataType.ID: DataType] = [:]) {
		self.data = data
	}

	open func updateData(_ dataUpdate: [DataType]) -> [DataType.ID] {
		var changedIds: [DataType.ID] = []
		for newData in dataUpdate {
			if let oldData = data[newData.id], oldData != newData {
				changedIds.append(newData.id)
			}
			data[newData.id] = newData
		}
		return changedIds
	}

	open func setData(_ dataUpdate: [DataType]) {
		data.removeAll()
		for newData in dataUpdate {
			self.data[newData.id] = newData
		}
	}

	open func removeAllData() {
		data.removeAll()
	}
}
