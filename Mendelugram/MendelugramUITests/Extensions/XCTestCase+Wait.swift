//
//  XCTestCase+Wait.swift
//  MendelugramUITests
//
//  Created by Tomas Cejka on 4/23/20.
//  Copyright © 2020 ČVUT. All rights reserved.
//


import XCTest

extension XCTestCase {
    func waitFor(_ element: XCUIElement, timeout: TimeInterval = 5) {

        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
