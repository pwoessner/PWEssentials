//
//  SubBag.swift
//  Foodplan
//
//  Created by Philipp Woessner on 13.01.22.
//

import Foundation
import Combine

public typealias SubBag = Set<AnyCancellable>

public extension SubBag {
	mutating func dispose() {
		forEach { $0.cancel() }
		removeAll()
	}
}
