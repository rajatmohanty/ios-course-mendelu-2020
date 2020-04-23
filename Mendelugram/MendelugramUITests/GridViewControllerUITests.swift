//
//  GridViewControllerUITests.swift
//  MendelugramUITests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 Mendelu. All rights reserved.
//

import XCTest

class GridViewControllerUITests: XCTestCase {

    // MARK: - Set Up
    override func setUp() {
        XCUIApplication().launch()
    }

    // MARK: - Test Cases
    func testGridCellsLoaded() {

        let app = XCUIApplication()
        app.tabBars.buttons["Grid"].tap()
        let cells = app.collectionViews.cells.element

        waitFor(cells)

        XCTAssert(cells.exists, "First cell should exists")
        XCTAssertEqual(app.collectionViews.cells.count, 15, "Number of cells should be 15")
    }

}
