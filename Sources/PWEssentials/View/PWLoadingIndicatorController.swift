//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 23.02.22.
//

import Foundation
import UIKit

public protocol PWLoadingIndicatorPresentable {
	func addToLoadingQueue(_ loadingState: PWLoadingState)
	func refreshLoadingIndicator()
}

public class PWLoadingIndicatorController {

	private weak var view: UIView?

	private let activityIndicator = UIActivityIndicatorView(style: .large)
	private var loadingCount = 0

	public var loadingOnGoing: Bool {
		loadingCount > 0
	}

	public init(on view: UIView) {
		self.view = view

		setupLoadingIndicator()
	}

	private func setupLoadingIndicator() {
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.hidesWhenStopped = true

		guard let view = view else {
			return
		}

		view.addSubview(activityIndicator)
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
	}

	public func addToLoadingQueue(_ loadingState: PWLoadingState) {
		loadingCount += loadingState.rawValue
	}

	public func refreshLoadingIndicator() {
		guard let view = view else {
			return
		}

		view.subviews.forEach { $0.isUserInteractionEnabled = !loadingOnGoing }

		view.bringSubviewToFront(activityIndicator)
		loadingOnGoing ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
	}
}

public enum PWLoadingState: Int {
	case started = 1
	case finished = -1
}
