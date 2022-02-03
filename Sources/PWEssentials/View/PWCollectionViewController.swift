//
//  CollectionViewController.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation
import UIKit

open class PWCollectionViewController<S: Hashable, I: Hashable>: UIViewController {
	public typealias ItemIdentifier = I
	public typealias Section = S
	public typealias DataSource = UICollectionViewDiffableDataSource<Section, ItemIdentifier>
	public typealias ListCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, ItemIdentifier>
	public typealias CellRegistration = UICollectionView.CellRegistration
	public typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ItemIdentifier>

	open var dataSource: DataSource!
	open var collectionView: UICollectionView!

	open func reconfigureItems(_ items: [ItemIdentifier]) {
		var snapshot = self.dataSource.snapshot()
		if #available(iOS 15.0, *) {
			snapshot.reconfigureItems(items)
		} else {
			snapshot.reloadItems(items)
		}
		self.dataSource.apply(snapshot, animatingDifferences: true)
	}
}
