//
//  AppRouter.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit

final class AppRouter {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    private var window: UIWindow? {
        get {
            AppDelegate.shared.window
        }
        set {
            AppDelegate.shared.window = newValue
        }
    }
    
    // MARK: - Initializer
    init(navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
    }
    
    // MARK: - EntryPoint
    func start() {
        setupMainWindow()
        navigateToRootViewController()
    }
}

// MARK: - Helpers
private extension AppRouter {
    func setupMainWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
    }
    
    func navigateToRootViewController() {
        let viewController = CharactersBuilder.createModule()
        navigationController.viewControllers = [viewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
