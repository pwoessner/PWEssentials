//
//  SubBag.swift
//  PWEssentials
//
//  Created by Philipp Woessner on 13.01.22.
//

import Foundation
import Combine

public typealias PWSubBag = Set<AnyCancellable>

public extension PWSubBag {
	mutating func dispose() {
		forEach { $0.cancel() }
		removeAll()
	}
}
