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
	public var isLoading: PassthroughSubject<Bool, Never>? {
		didSet {
			observeIsLoading()
		}
	}

	public var currentError: PassthroughSubject<Error, Never>? {
		didSet {
			observeErrors()
		}
	}

	private var subs = PWSubBag()

	private var loadingIndicatorController: PWLoadingIndicatorController?
	private var effectViewController: PWEffectViewController?


	public init() {
		super.init(nibName: nil, bundle: nil)
	}

	public required init?(coder: NSCoder) {
		fatalError("required init not implemented")
	}

	public func setupBlurAndLoading() {
		loadingIndicatorController = PWLoadingIndicatorController(on: view)
		effectViewController = PWEffectViewController(on: view)
	}

	private func observeIsLoading() {
		isLoading?
			.receive(on: DispatchQueue.main)
			.sink { [weak self] isLoading in
				guard let self = self else { return }

				self.effectViewController?.showBlurView(self.loadingIndicatorController?.loadingOnGoing ?? false)
				self.loadingIndicatorController?.evaluateLoading(isLoading: isLoading)
			}
			.store(in: &subs)
	}

	// MARK: - Error Handling
	open func handle(_ error: Error) {
		let alert = error.getAlert(title: PWEssentialsStrings.General.errorTitle, message: PWEssentialsStrings.General.errorMessage, leadingButton: .generalOkButton)
		presentAlert(alert)
	}

	private func observeErrors() {
		currentError?
			.receive(on: DispatchQueue.main)
			.sink { [weak self] error in
				self?.handle(error)
			}
			.store(in: &subs)
	}
}

// MARK: - Loading Indicator
extension PWViewController: PWLoadingIndicatorPresentable {
	public func evaluateLoading(isLoading: Bool) {
		loadingIndicatorController?.evaluateLoading(isLoading: isLoading)
	}
}

// MARK: - Effect View
extension PWViewController: PWEffectViewPresentable {
	public func showBlurView(_ show: Bool, bringToFront: Bool = true) {
		effectViewController?.showBlurView(show, bringToFront: bringToFront)
	}
}
