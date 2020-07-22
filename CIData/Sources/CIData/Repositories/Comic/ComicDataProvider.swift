//
//  ComicDataProvider.swift
//  CIData
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Comic
import Foundation

public struct ComicDataProvider {

    private let comicAPIWrapper: ComicAPIWrapper
    private let comicCacheService: ComicCacheService

    init(
        comicAPIWrapper: ComicAPIWrapper,
        comicCacheService: ComicCacheService
    ) {
        self.comicAPIWrapper = comicAPIWrapper
        self.comicCacheService = comicCacheService
    }

    func getComics(
        forSeriesID seriesID: String,
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<[Domain.Comic], Error>) -> Void
    ) {
        switch dataSource {
        case .memory:
            if let comicsFromMemory = getComicsFromMemory(forSeriesID: seriesID) {
                return complete(.success(comicsFromMemory))
            }

        case .network:
            break
        }

        getComicsFromNetwork(forSeriesID: seriesID, onComplete: complete)
    }

    private func getComicsFromMemory(forSeriesID seriesID: String) -> [Domain.Comic]? {
        guard let comics = comicCacheService.getComics(forSeriesID: seriesID) else {
            return nil
        }
        return comics.isEmpty ? nil : comics
    }

    private func getComicsFromNetwork(
        forSeriesID seriesID: String,
        onComplete complete: @escaping (Result<[Domain.Comic], Error>) -> Void
    ) {
        comicAPIWrapper.getComics(forSeriesID: seriesID) { (result: Result<[Domain.Comic], Error>) in
            switch result {
            case let .success(comics):
                self.comicCacheService.save(comics: comics)
                complete(.success(comics))

            case let .failure(error):
                complete(.failure(error))
            }
        }
    }

}
