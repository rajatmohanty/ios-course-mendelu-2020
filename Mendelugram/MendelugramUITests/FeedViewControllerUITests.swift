//
//  File.swift
//  MendelugramUITests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 Mendelu. All rights reserved.
//

import XCTest

class FeedViewControllerUITests: XCTestCase {

    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }

    // MARK: - Test Cases
    func testFeedTableViewData() {

        let app = XCUIApplication()
        let cells = app.tables.cells.element

        waitFor(cells)

        XCTAssert(cells.exists, "Cells should exists")

    }
}
