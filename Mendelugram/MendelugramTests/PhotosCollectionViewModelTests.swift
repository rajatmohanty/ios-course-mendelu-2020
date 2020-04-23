//
//  PhotosCollectionViewModelTests.swift
//  MendelugramTests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 ČVUT. All rights reserved.
//

import XCTest
@testable import Mendelugram

// We are testing protocols! :)
// Don't forget DI is used for mocking your functionalities.
// We use mocked classes for isolating conditions we are depending on.

//protocol PhotosCollectionViewModeling {
//
//    var didUpdatePhotos: (() -> Void)? { get set }
//
//    func updatePhotos()
//    func numberOfPhotos() -> Int
//    func photo(at index: Int) -> Photo
//
//}

class PhotosCollectionViewModelTests: XCTestCase {

    // MARK: - Variables
    private var mockPhotosService = MockPhotosService()

    // MARK: - Set Up
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        mockPhotosService.photos = [
            MockData.mockPhoto,
            MockData.mockPhoto2,
            MockData.mockPhoto3
        ]
    }

    // MARK: - Test Cases

    func testUpdatePhotosSuccess() {
        let viewModel = PhotosCollectionViewModel(photosService: mockPhotosService)

        var updateSuccessful = false

        viewModel.didUpdatePhotos = {

            updateSuccessful = true
        }
        viewModel.updatePhotos()

        XCTAssert(updateSuccessful, "didUpdatePhotos should be called")
    }

    func testUpdatePhotosNumberSuccess() {

        // example of solution in case of asynchronous method did update photos
        let expectation = XCTestExpectation(description: "Did update photos callback")

        let viewModel = PhotosCollectionViewModel(photosService: mockPhotosService)

        // First we are gonna to check if the number of photos is zero
        XCTAssert(viewModel.numberOfPhotos() == 0, "Number of photos should be 0")

        // #didUpdatePhotos()# should be initialized first it's closure used in #didUpdatePhotos()#
        viewModel.didUpdatePhotos = {

            XCTAssert(viewModel.numberOfPhotos() == 3, "Number of photos should be 3")
            expectation.fulfill()
        }
 
        viewModel.updatePhotos()

        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
}
