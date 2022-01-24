//
//  SubBag.swift
//  Foodplan
//
//  Created by Philipp Woessner on 13.01.22.
//

import Foundation
import Combine

typealias SubBag = Set<AnyCancellable>

extension SubBag {
	mutating func dispose() {
		forEach { $0.cancel() }
		removeAll()
	}
}
