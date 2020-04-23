//
//  MockPhotoService.swift
//  MendelugramTests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 Mendelu. All rights reserved.
//

@testable import Mendelugram

// MARK: - Mock Service
struct MockPhotosService: PhotosServicing {

    var photos = [Photo]()

    func fetchPhotos(completion: @escaping ([Photo]) -> Void) {

        completion(photos)
    }
}
