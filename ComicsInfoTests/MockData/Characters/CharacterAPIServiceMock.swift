//
//  CharacterAPIServiceMock.swift
//  ComicsInfoTests
//
//  Created by Aleksandar Dinic on 08/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

@testable import protocol ComicsInfo.CharacterAPIService
import Foundation

final class CharacterAPIServiceMock: CharacterAPIService {

    private let data: Data?

    init(_ data: Data? = nil) {
        self.data = data
    }

    func getAllCharacters(
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let data = data else {
            return complete(.failure(ErrorMock.noData))
        }
        complete(.success(data))
    }

    func getCharacter(
        withID characterID: String,
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let data = data else {
            return complete(.failure(ErrorMock.noData))
        }
        complete(.success(data))
    }

}