//
//  FeedCoordinator.swift
//  Mendelugram
//
//  Created by Lukáš Tesař on 14/04/2020.
//  Copyright © 2020 Mendelu. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinating {

    private let resolver: DependencyResolving
    private weak var navController: UINavigationController?

    init(navController: UINavigationController, resolver: DependencyResolving) {
        self.navController = navController
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let viewController = resolver.resolveFeedViewController()
        viewController.coordinator = self
        return viewController
    }
    
    func select(photo: Photo) {
        let viewController = PhotoDetailCoordinator(photo: photo, resolver: resolver).begin()
        navController?.pushViewController(viewController, animated: true)
    }
    
    deinit {
        print("FeedCoordinator deinit")
    }
}
