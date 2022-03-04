//
//  File.swift
//  
//
//  Created by Woessner, Philipp on 25.02.22.
//

import Foundation
import SwiftUI

open class PWHostingController<ContentView: View>: PWViewController {

	private let hostingController: UIHostingController<ContentView>

	public init(hostingController: UIHostingController<ContentView>) {
		self.hostingController = hostingController

		super.init()
	}

	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func viewDidLoad() {
		super.viewDidLoad()

		addChild(hostingController)
		view.addSubview(hostingController.view)

		hostingController.view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
			hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])

		setupBlurAndLoading()
	}
}
