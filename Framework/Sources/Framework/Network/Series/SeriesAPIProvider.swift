//
//  SeriesAPIProvider.swift
//  Framework
//
//  Created by Aleksandar Dinic on 20/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import protocol CIData.SeriesAPIService
import Foundation

public struct SeriesAPIProvider: CIData.SeriesAPIService {

    public func getSeries(
        forCharacterID characterID: String,
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    ) {
        usleep(useconds_t(Int.random(in: 500_000...2_000_000)))
        guard let data = SeriesMock(forCharacterID: characterID).data else {
            return complete(.failure(NetworkError.noData))
        }
        complete(.success(data))
    }

}