//
//  SeriesAPIServiceTests.swift
//  FrameworkTests
//
//  Created by Aleksandar Dinic on 20/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

@testable import Framework
import XCTest

final class SeriesAPIServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetCharacters() {
        // Given
        let sut = SeriesAPIProvider()

        var result: Result<Data, Error>?
        let promise = expectation(description: #function)

        // When
        sut.getSeries(forCharacterID: "1") {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        XCTAssertNoThrow(try res.get())
    }

}