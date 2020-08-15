//
//  CharacterAPIWrapper.swift
//  CIData
//
//  Created by Aleksandar Dinic on 08/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Character
import Foundation

public struct CharacterAPIWrapper: ResultDecoder {

    private let characterAPIService: CharacterAPIService

    init(characterAPIService: CharacterAPIService) {
        self.characterAPIService = characterAPIService
    }

    func getAllCharacters(
        onComplete complete: @escaping (Result<[Domain.Character], Error>) -> Void
    ) {
        characterAPIService.getAllCharacters { result in
            complete(decode(result))
        }
    }

    func getCharacter(
        withID characterID: String,
        onComplete complete: @escaping (Result<Domain.Character, Error>) -> Void
    ) {
        characterAPIService.getCharacter(withID: characterID) { result in
            complete(decode(result))
        }
    }

}
