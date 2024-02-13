//
//  MoviePediaTests.swift
//  MoviePediaTests
//
//  Created by Prashil Alva on 11/02/24.
//

import XCTest
import MoviePedia

final class MoviePediaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Unit test to check Cast and Crew Controller
    func testCastAndCrewControllerPositiveFlow() async {
        let result = await MPCastAndCrewController.obtainCastAndCrew(for: 866398)
        XCTAssert(result.cast.count > 0 && result.crew.count > 0)
    }
    
    // Unit test to check Image Controller
    func testImageControllerPositiveFlow() async {
        let result = await MPImageController.obtainImages(for: 866398)
        XCTAssert(result.count > 0)
    }
    
    // Unit test to check Video Controller
    func testVideoControllerPositiveFlow() async {
        let result = await MPVideoController.obtainVideos(for: 866398)
        XCTAssert(result.results.count > 0)
    }
    
    // Unit test to check Keyword Controller
    func testKeywordControllerPositiveFlow() async {
        let result = await MPKeywordController.getKeywords(for: 866398)
        XCTAssert(result.keywords.count > 0)
    }
    
    // Unit test to check Cast and Crew Controller Negative Flow
    func testCastAndCrewControllerNegativeFlow() async {
        let result = await MPCastAndCrewController.obtainCastAndCrew(for: 0)
        XCTAssertFalse(result.cast.count > 0 && result.crew.count > 0)
    }
    
    // Unit test to check Image Controller Negative Flow
    func testImageControllerNegativeFlow() async {
        let result = await MPImageController.obtainImages(for: 0)
        XCTAssertFalse(result.count > 0)
    }
    
    // Unit test to check Video Controller Negative Flow
    func testVideoControllerNegativeFlow() async {
        let result = await MPVideoController.obtainVideos(for: 0)
        XCTAssertFalse(result.results.count > 0)
    }
    
    // Unit test to check Keyword Controller Negative Flow
    func testKeywordControllerNegativeFlow() async {
        let result = await MPKeywordController.getKeywords(for: 0)
        XCTAssertFalse(result.keywords.count > 0)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
