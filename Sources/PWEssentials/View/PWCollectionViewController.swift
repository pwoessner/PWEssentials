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

	open func deleteItems(_ items: [ItemIdentifier]) {
		var snapshot = dataSource.snapshot()
		snapshot.deleteItems(items)
		dataSource.apply(snapshot)
	}

	open func setupKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
			collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		UIView.animate(withDuration: 0.2, animations: { [weak self] in
			// For some reason adding inset in keyboardWillShow is animated by itself but removing is not, that's why we have to use animateWithDuration here
			self?.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		})
	}

	open func invalidateLayout(at indexPaths: [IndexPath]) {
		let invalidationContext = UICollectionViewLayoutInvalidationContext()
		invalidationContext.invalidateItems(at: indexPaths)
		collectionView.collectionViewLayout.invalidateLayout(with: invalidationContext)
	}
}
