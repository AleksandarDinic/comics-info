//
//  CharacterAPIWrapperTests.swift
//  ComicsInfoTests
//
//  Created by Aleksandar Dinic on 08/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

@testable import Comics_Info__Development_
import XCTest

final class CharacterAPIWrapperTests: XCTestCase {

    private var limit: Int!
    
    override func setUpWithError() throws {
        limit = 20
    }

    override func tearDownWithError() throws {
        limit = nil
    }

    // MARK: - Characters

    func testGetAllCharactersSuccess() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithCharacters()
        var result: Result<[Character], Error>?
        let promise = expectation(description: #function)

        // When
        sut.getAllCharacters(afterID: nil, fields: nil, limit: limit) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        do {
            let characters = try res.get()
            XCTAssertEqual(characters.count, 3)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetAllCharactersFailure() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithoutData()
        var result: Result<[Character], Error>?
        let promise = expectation(description: #function)

        // When
        sut.getAllCharacters(afterID: nil, fields: nil, limit: limit) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        XCTAssertThrowsError(try res.get())
    }

    func testGetAllCharactersFailureBadData() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithCharactersBadData()
        var result: Result<[Character], Error>?
        let promise = expectation(description: #function)

        // When
        sut.getAllCharacters(afterID: nil, fields: nil, limit: limit) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        XCTAssertThrowsError(try res.get())
    }

    // MARK: - Character

    func testGetAllCharacterSuccess() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithCharacter()
        let characterID = "1"
        var result: Result<Character, Error>?
        let promise = expectation(description: #function)

        // When
        sut.getCharacter(withID: characterID) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        do {
            let character = try res.get()
            XCTAssertEqual(character.identifier, characterID)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetCharacterFailure() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithoutData()
        let characterID = "1"
        var result: Result<Character, Error>?
        let promise = expectation(description: #function)

        // When
        sut.getCharacter(withID: characterID) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        XCTAssertThrowsError(try res.get())
    }

    func testGetCharacterFailureBadData() {
        // Given
        let sut = CharacterAPIWrapperMockFactory.makeWithCharacterBadData()
        let characterID = "1"
        var result: Result<Character, Error>?
        let promise = expectation(description: #function)

        // When
        sut.getCharacter(withID: characterID) {
            result = $0
            promise.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)

        guard let res = result else {
            return XCTFail("Result is nil")
        }

        XCTAssertThrowsError(try res.get())
    }

}
