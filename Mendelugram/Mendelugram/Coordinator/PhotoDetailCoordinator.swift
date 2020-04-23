//
//  PhotoDetailCoordinator.swift
//  Mendelugram
//
//  Created by Lukáš Tesař on 14/04/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import UIKit

class PhotoDetailCoordinator: Coordinating {

    private let photo: Photo
    private let resolver: DependencyResolving

    init(photo: Photo, resolver: DependencyResolving) {
        self.photo = photo
        self.resolver = resolver
    }

    func begin() -> UIViewController {
        let viewController = resolver.resolvePhotoDetailViewController(photo: photo)
        viewController.coordinator = self
        return viewController
    }

    deinit {
        print("PhotoDetailCoordinator deinit")
    }

}
