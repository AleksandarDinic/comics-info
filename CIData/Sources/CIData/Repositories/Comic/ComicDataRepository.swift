//
//  ComicDataRepository.swift
//  CIData
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class ComicDataRepository: ComicRepository {

    var comicDataProvider: ComicDataProvider

    init(comicDataProvider: ComicDataProvider) {
        self.comicDataProvider = comicDataProvider
    }

    func getAllComics(
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<[Comic], Error>) -> Void
    ) {
        comicDataProvider.getAllComics(
            fromDataSource: dataSource,
            onComplete: complete
        )
    }
    
    func getComic(
        withID comicID: String,
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<Comic, Error>) -> Void
    ) {
        comicDataProvider.getComic(
            withID: comicID,
            fromDataSource: dataSource,
            onComplete: complete
        )
    }

}
