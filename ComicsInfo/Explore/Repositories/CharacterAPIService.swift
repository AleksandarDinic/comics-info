//
//  CharacterAPIService.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 08/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol CharacterAPIService {

    func getAllCharacters(
        afterID: String?,
        fields: Set<String>?,
        limit: Int,
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    )

    func getCharacter(
        withID characterID: String,
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    )

}
