//
//  RootCoordinator.swift
//  Mendelugram
//
//  Created by Lukáš Tesař on 14/04/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinating {

    private let resolver: DependencyResolving

    init(resolver: DependencyResolving) {
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let tabBarController = resolver.resolveMainTabBarController()
        tabBarController.viewControllers = [
            beginFeed(),
            beginGrid()
        ]
        return tabBarController
    }
}

private extension RootCoordinator {

    func beginFeed() -> UIViewController {
        let navController = NavigationController()
        let coordinator = FeedCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }

    func beginGrid() -> UIViewController {
        let navController = NavigationController()
        let coordinator = GridCoordinator(navController: navController, resolver: resolver)
        let viewController = coordinator.begin()
        navController.viewControllers = [viewController]
        return navController
    }
}
