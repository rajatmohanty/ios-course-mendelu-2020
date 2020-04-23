//
//  DependencyResolving.swift
//  Mendelugram
//
//  Created by Lukáš Tesař on 14/04/2020.
//  Copyright © 2020 Mendelu. All rights reserved.
//

import UIKit

protocol DependencyResolving {

    func resolveMainTabBarController() -> MainTabBarViewController
    func resolveFeedViewController() -> FeedViewController
    func resolveGridViewController() -> GridViewController
    func resolvePhotoDetailViewController(photo: Photo) -> PhotoDetailViewController

    func resolvePhotosCollectionViewModel() -> PhotosCollectionViewModeling
    func resolvePhotosService() -> PhotosServicing

}

extension DependencyResolving {

    func resolveMainTabBarController() -> MainTabBarViewController {
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        return storyboard.instantiateInitialViewController() as! MainTabBarViewController
    }

    func resolveFeedViewController() -> FeedViewController {
        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! FeedViewController
        viewController.viewModel = resolvePhotosCollectionViewModel()
        return viewController
    }

    func resolveGridViewController() -> GridViewController {
        let storyboard = UIStoryboard(name: "Grid", bundle: nil)
        let viewController =  storyboard.instantiateInitialViewController() as! GridViewController
        viewController.viewModel = resolvePhotosCollectionViewModel()
        return viewController
    }

    func resolvePhotoDetailViewController(photo: Photo) -> PhotoDetailViewController {
        let storyboard = UIStoryboard(name: "PhotoDetail", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! PhotoDetailViewController
        viewController.hidesBottomBarWhenPushed = true
        viewController.photo = photo
        return viewController
    }

    func resolvePhotosCollectionViewModel() -> PhotosCollectionViewModeling {
        return PhotosCollectionViewModel(photosService: resolvePhotosService())
    }

    func resolvePhotosService() -> PhotosServicing {
        return PhotosService()
    }

}
