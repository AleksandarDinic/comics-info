//
//  SeriesAPIWrapper.swift
//  CIData
//
//  Created by Aleksandar Dinic on 21/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Series
import Foundation

public struct SeriesAPIWrapper: ResultDecoder {

    private let seriesAPIService: SeriesAPIService

    init(seriesAPIService: SeriesAPIService) {
        self.seriesAPIService = seriesAPIService
    }

    func getAllSeries(
        forCharacters characters: [String],
        onComplete complete: @escaping (Result<[Domain.Series], Error>) -> Void
    ) {
        seriesAPIService.getAllSeries(forCharacters: characters.joined(separator: ",")) { result in
            complete(self.decode(result))
        }
    }

}
