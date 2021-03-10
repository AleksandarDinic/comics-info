//
//  SeriesAPIWrapper.swift
//  CIData
//
//  Created by Aleksandar Dinic on 21/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Series
import Foundation

public struct SeriesAPIWrapper: DecoderService {

    private let seriesAPIService: SeriesAPIService

    init(seriesAPIService: SeriesAPIService) {
        self.seriesAPIService = seriesAPIService
    }
    
    func getAllSeries(
        onComplete complete: @escaping (Result<[Series], Error>) -> Void
    ) {
        seriesAPIService.getAllSeries() { result in
            switch result {
            case let .success(data):
                let decodedResult: Result<[Domain.Series], Error> = decode(from: data)
                complete(decodedResult.map({ $0.map({ Series(from: $0) }) }))

            case let .failure(error):
                complete(.failure(error))
            }
        }
    }

    func getSeries(
        withID seriesID: String,
        onComplete complete: @escaping (Result<Series, Error>) -> Void
    ) {
        seriesAPIService.getSeries(withID: seriesID) { result in
            switch result {
            case let .success(data):
                let decodedResult: Result<Domain.Series, Error> = decode(from: data)
                complete(decodedResult.map({ Series(from: $0) }))

            case let .failure(error):
                complete(.failure(error))
            }
        }
    }

}
