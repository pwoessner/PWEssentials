//
//  CollectionViewController.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 15.01.22.
//

import Foundation
import UIKit

open class WPCollectionViewController<S: Hashable, I: Hashable>: UIViewController {
	public typealias Item = I
	public typealias Section = S
	public typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
	public typealias CellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>
	public typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

	open var dataSource: DataSource!
	open var collectionView: UICollectionView!

	open func reconfigureItems(_ items: [Item]) {
		var snapshot = self.dataSource.snapshot()
		if #available(iOS 15.0, *) {
			snapshot.reconfigureItems(items)
		} else {
			snapshot.reloadItems(items)
		}
		self.dataSource.apply(snapshot, animatingDifferences: true)
	}
}
