//
//  CharacterDecoderMock.swift
//  CIDataTests
//
//  Created by Aleksandar Dinic on 21/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Character
import protocol CIData.CharacterDecoderService
import Foundation

final class CharacterDecoderMock: CIData.CharacterDecoderService {

    private let characters: [Domain.Character]

    init(_ characters: [Domain.Character] = []) {
        self.characters = characters
    }

    func decodeAllCharacters(from data: Data) -> Result<[Domain.Character], Error> {
        !characters.isEmpty ? .success(characters) : .failure(ErrorMock.noData)
    }

    func decodeCharacter(from data: Data) -> Result<Domain.Character, Error> {
        guard let character = characters.first else {
            return .failure(ErrorMock.noData)
        }
        return .success(character)
    }

}
