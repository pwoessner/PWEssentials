//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 22.02.22.
//

import Foundation
import UIKit
import Combine

open class PWViewController: UIViewController {
	public var isLoading = PassthroughSubject<Bool, Never>()
	public var currentError = PassthroughSubject<Error, Never>()

	private var subs = PWSubBag()
	private let activityIndicator = UIActivityIndicatorView(style: .large)
	private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))


	// MARK: - Loading Indicator
	public func setupLoading() {
		blurEffectView.isHidden = true
		blurEffectView.frame = view.bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(blurEffectView)

		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.hidesWhenStopped = true
		view.addSubview(activityIndicator)

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])

		observeIsLoading()
	}

	private func observeIsLoading() {
		isLoading
			.receive(on: DispatchQueue.main)
			.sink { [weak self] showLoading in
				guard let self = self else { return }

				self.view.subviews.forEach { $0.isUserInteractionEnabled = !showLoading }

				self.view.bringSubviewToFront(self.blurEffectView)
				self.blurEffectView.isHidden = !showLoading

				self.view.bringSubviewToFront(self.activityIndicator)
				showLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
			}
			.store(in: &subs)
	}

	// MARK: - Error Handling
	open func handle(_ error: Error) {
		let alert = error.getAlert(title: PWEssentialsStrings.General.errorTitle, message: PWEssentialsStrings.General.errorMessage, leadingButton: .generalOkButton)
		presentAlert(alert)
	}

	public func observeErrors() {
		currentError
			.receive(on: DispatchQueue.main)
			.sink { [weak self] error in
				self?.handle(error)
			}
			.store(in: &subs)
	}
}
