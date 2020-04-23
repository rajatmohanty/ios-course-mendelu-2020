//
//  MainTabBarViewControllerUITests.swift
//  MendelugramUITests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 Mendelu. All rights reserved.
//

import XCTest

class MainTabBarViewControllerUITests: XCTestCase {

    // MARK: - Constants
    struct Constants {
        static let gridTabBarTitle = "Grid"
        static let feedTabBarTitle = "Feed"
    }

    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }

    // MARK: - Test Cases
    func testTabBarButtons() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars

        let gridTabBarButton = tabBarsQuery.buttons[Constants.gridTabBarTitle]
        let feedTabBarButton = tabBarsQuery.buttons[Constants.feedTabBarTitle]

        XCTAssert(gridTabBarButton.exists, "Grid Tab Bar Item should exist")
        XCTAssert(feedTabBarButton.exists, "Feed Tab Bar Item should exist")
    }

}
