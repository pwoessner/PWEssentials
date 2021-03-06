//
//  PWPageViewController.swift
//  PWEssentials
//
//  Created by Woessner, Philipp on 22.02.22.
//

import Foundation
import UIKit
import Combine

public protocol PWPagePresentable: AnyObject {
    func showPages(_ pageViewController: PWPageViewController)
    func removePages(_ pageViewController: PWPageViewController)
}

public struct PWPageViewControllerConfiguration {
    let cornerRadius: CGFloat
    let showPageControl: Bool
    let showCloseButton: Bool
    let showCloseButtonOnlyForLast: Bool
    public var closeAction: (() -> Void)?

    public static var onboardingConfiguration: PWPageViewControllerConfiguration {
        return PWPageViewControllerConfiguration(cornerRadius: PWStyling.maxCornerRadius,
                                                       showPageControl: true,
                                                       showCloseButton: true,
                                                       showCloseButtonOnlyForLast: true)
    }

    public static var errorConfiguration: PWPageViewControllerConfiguration {
        return PWPageViewControllerConfiguration(cornerRadius: PWStyling.maxCornerRadius,
                                                 showPageControl: false,
                                                 showCloseButton: false,
                                                 showCloseButtonOnlyForLast: false)
    }
}

public class PWPageViewController: UIPageViewController {
	enum Position {
		case before
		case after
	}

	private let closeButton = UIButton(type: .close)
	private let pageControl = UIPageControl()

	private weak var pageDelegate: PWPagePresentable?
	private var pages: [UIViewController]

    private var subs = PWSubBag()
    public var loadingState = PassthroughSubject<PWLoadingState, Never>()
    private var loadingIndicatorController: PWLoadingIndicatorController?

    public let configuration: PWPageViewControllerConfiguration

	public init(pageDelegate: PWPagePresentable?,
				pages: [UIViewController],
                configuration: PWPageViewControllerConfiguration) {
		self.pageDelegate = pageDelegate
		self.pages = pages
        self.configuration = configuration

		super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .appPrimaryBackground
		view.layer.cornerRadius = PWStyling.maxCornerRadius

		setupPages()

        if configuration.showPageControl {
            setupPageControl()
        }

        if configuration.showCloseButton {
            setupCloseButton()
        }

        setupLoadingController()

		dataSource = self
		delegate = self
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

    private func setupCloseButton() {
        closeButton.isHidden = configuration.showCloseButtonOnlyForLast

        closeButton.addTarget(self, action: #selector(closePageViewController), for: .touchUpInside)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: PWSpacing.medium),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -PWSpacing.medium)
        ])
    }

    private func setupLoadingController() {
        loadingIndicatorController = PWLoadingIndicatorController(on: view)

        loadingState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadingState in
                self?.loadingIndicatorController?.addToLoadingQueue(loadingState)
                self?.loadingIndicatorController?.refreshLoadingIndicator()
            }
            .store(in: &subs)
    }

	@objc private func closePageViewController() {
		pageDelegate?.removePages(self)
	}
}

extension PWPageViewController: UIPageViewControllerDelegate {
	public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		guard finished, let currentViewController = pageViewController.viewControllers?.first else { return }

		let currentIndex = getIndexOf(current: currentViewController)

		pageControl.currentPage = currentIndex

        if configuration.showCloseButton, configuration.showCloseButtonOnlyForLast {
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
