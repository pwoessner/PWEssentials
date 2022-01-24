//
//  CollectionViewController.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation
import UIKit

class CollectionViewController<S: Hashable, I: Hashable>: UIViewController {
	typealias Item = I
	typealias Section = S
	typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
	typealias CellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>
	typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

	var dataSource: DataSource!
	var collectionView: UICollectionView!

	func reconfigureItems(_ items: [Item]) {
		var snapshot = self.dataSource.snapshot()
		if #available(iOS 15.0, *) {
			snapshot.reconfigureItems(items)
		} else {
			snapshot.reloadItems(items)
		}
		self.dataSource.apply(snapshot, animatingDifferences: true)
	}
}
