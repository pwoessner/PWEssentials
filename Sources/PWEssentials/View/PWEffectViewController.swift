//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 23.02.22.
//

import Foundation
import UIKit


public protocol PWEffectViewPresentable {
	func showBlurView(_ show: Bool, bringToFront: Bool)
}

public class PWEffectViewController {
	private let visualEffect: UIVisualEffect
	private var visualEffectView: UIVisualEffectView

	private weak var view: UIView?

	public init(on view: UIView, visualEffect: UIVisualEffect = UIBlurEffect(style: .systemUltraThinMaterial)) {
		self.view = view
		self.visualEffect = visualEffect
		self.visualEffectView = UIVisualEffectView(effect: visualEffect)

		setupBlurEffect()
	}

	private func setupBlurEffect() {
		visualEffectView.isHidden = true
		visualEffectView.translatesAutoresizingMaskIntoConstraints = false

		guard let view = view else {
			return
		}

		view.addSubview(visualEffectView)
		NSLayoutConstraint.activate([
			visualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
			visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}

	public func showBlurView(_ show: Bool, bringToFront: Bool = true) {
		guard let view = view else {
			return
		}

		if bringToFront {
			view.bringSubviewToFront(visualEffectView)
		}
		visualEffectView.isHidden = !show
	}
}
