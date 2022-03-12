//
//  PWDismissable.swift
//  
//
//  Created by Philipp Woessner on 12.03.22.
//

import Foundation
import UIKit

public protocol PWDismissable {
	func dismiss(on navigationController: UINavigationController?, with presenterDelegate: PWPresenterDelegate?)
	func popToRoot(on navigationController: UINavigationController?)
}
