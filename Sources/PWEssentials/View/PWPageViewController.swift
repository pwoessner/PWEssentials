//
//  PWPageViewController.swift
//  Foodplan
//
//  Created by Woessner, Philipp on 22.02.22.
//

import Foundation
import UIKit

public protocol PWBottomPageViewControllerPresentable: AnyObject {
	func addAndShowBottomPageViewController(on viewController: UIViewController,
											with pages: [UIViewController],
											closeOnlyOnLastPage: Bool,
											closeAction: (() -> Void)?)
	func removeAndHideBottomPageViewController()
}

public class PWPageViewController: UIPageViewController {
	enum Position {
		case before
		case after
	}

	private let closeButton = UIButton(type: .close)
	private let pageControl = UIPageControl()

	private weak var pageDelegate: PWBottomPageViewControllerPresentable?
	private var pages: [UIViewController]
	private let cornerRadius: CGFloat
	private var closeOnlyOnLastPage: Bool
	private var closeAction: (() -> Void)?

	public init(pageDelegate: PWBottomPageViewControllerPresentable?,
				pages: [UIViewController],
				cornerRadius: CGFloat = PWStyling.maxCornerRadius,
				closeOnlyOnLastPage: Bool = false,
				closeAction: (() -> Void)?) {
		self.pageDelegate = pageDelegate
		self.pages = pages
		self.cornerRadius = cornerRadius
		self.closeOnlyOnLastPage = closeOnlyOnLastPage
		self.closeAction = closeAction

		super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .appBackground
		view.layer.cornerRadius = PWStyling.maxCornerRadius

		setupPages()
		setupPageControl()
		setupCloseButton()

		dataSource = self
		delegate = self
	}

	private func setupCloseButton() {
		closeButton.isHidden = closeOnlyOnLastPage

		closeButton.addTarget(self, action: #selector(closePageViewController), for: .touchUpInside)

		closeButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(closeButton)

		NSLayoutConstraint.activate([
			closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: PWSpacing.medium),
			closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -PWSpacing.medium)
		])
	}

	private func setupPages() {
		guard let firstPage = pages.first else { return }
		setViewControllers([firstPage], direction: .forward, animated: true)
	}

	private func setupPageControl() {
		pageControl.numberOfPages = pages.count

		view.addSubview(pageControl)

		pageControl.backgroundStyle = .prominent
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -PWSpacing.small),
			pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}

	@objc private func closePageViewController() {
		closeAction?()
		pageDelegate?.removeAndHideBottomPageViewController()
	}
}

extension PWPageViewController: UIPageViewControllerDelegate {
	public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		guard finished, let currentViewController = pageViewController.viewControllers?.first else { return }

		let currentIndex = getIndexOf(current: currentViewController)

		pageControl.currentPage = currentIndex

		if closeOnlyOnLastPage {
			closeButton.isHidden = currentIndex != (pages.endIndex - 1)
		}
	}
}

extension PWPageViewController: UIPageViewControllerDataSource {
	public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		getPageViewController(viewController, for: .before)
	}

	public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		getPageViewController(viewController, for: .after)
	}

	private func getPageViewController(_ viewController: UIViewController, for position: Position) -> UIViewController? {
		let currentIndex = getIndexOf(current: viewController)

		var neededIndex: Int
		switch position {
		case .before:
			neededIndex = currentIndex - 1
		case .after:
			neededIndex = currentIndex + 1
		}

		return pages.indices.contains(neededIndex) ? pages[neededIndex] : nil
	}

	private func getIndexOf(current viewController: UIViewController) -> Int {
		guard let currentIndex = pages.firstIndex(of: viewController) else {
			return 0
		}

		return currentIndex
	}
}
