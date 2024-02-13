//
//  MoviePediaUITests.swift
//  MoviePediaUITests
//
//  Created by Prashil Alva on 11/02/24.
//

import XCTest

final class MoviePediaUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test Case to Check the App UI Flow Positive Flow
    func testAppFlow() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        
        let _ = app.waitForExistence(timeout: 5)
        
        app.staticTexts["Badland Hunters"].tap()
        
        let _ = app.waitForExistence(timeout: 5)

        XCTAssert(app.staticTexts["Badland Hunters"].exists)
    }
    
    // Test Case to Check the App UI Flow Negative Flow
    func testAppFlowNegative() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        
        let _ = app.waitForExistence(timeout: 5)
        
        app.staticTexts["Badland Hunters"].tap()
        
        let _ = app.waitForExistence(timeout: 5)

        XCTAssertFalse(app.staticTexts["Wonka"].exists)
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
