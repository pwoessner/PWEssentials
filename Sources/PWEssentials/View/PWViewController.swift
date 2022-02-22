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
	private var loadingCount = 0
	private let activityIndicator = UIActivityIndicatorView(style: .large)
	private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))

	private var loadingOnGoing: Bool {
		loadingCount > 0
	}

	public init() {
		super.init(nibName: nil, bundle: nil)

		observeErrors()
	}

	public required init?(coder: NSCoder) {
		fatalError("required init not implemented")
	}

	// MARK: - Loading Indicator
	public func setupLoadingIndicator() {
		blurEffectView.isHidden = true
		blurEffectView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(blurEffectView)
		NSLayoutConstraint.activate([
			blurEffectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			blurEffectView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			blurEffectView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])

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

				self.loadingCount = showLoading ? self.loadingCount + 1 : self.loadingCount - 1

				self.view.subviews.forEach { $0.isUserInteractionEnabled = !self.loadingOnGoing }

				self.view.bringSubviewToFront(self.blurEffectView)
				self.blurEffectView.isHidden = !self.loadingOnGoing

				self.view.bringSubviewToFront(self.activityIndicator)
				self.loadingOnGoing ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
			}
			.store(in: &subs)
	}

	// MARK: - Error Handling
	open func handle(_ error: Error) {
		let alert = error.getAlert(title: PWEssentialsStrings.General.errorTitle, message: PWEssentialsStrings.General.errorMessage, leadingButton: .generalOkButton)
		presentAlert(alert)
	}

	private func observeErrors() {
		currentError
			.receive(on: DispatchQueue.main)
			.sink { [weak self] error in
				self?.handle(error)
			}
			.store(in: &subs)
	}
}
