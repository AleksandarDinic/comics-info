//
//  ComicUseCase.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import enum CIData.DataSourceLayer
import protocol CIData.ComicAPIService
import protocol CIData.ComicCacheService
import protocol CIData.ComicRepositoryFactory
import Foundation

final class ComicUseCase: CIData.ComicRepositoryFactory {

    private lazy var repository = makeComicRepository()

    let comicAPIService: ComicAPIService
    let comicCacheService: ComicCacheService

    init(
        comicAPIService: ComicAPIService = ComicAPIProvider(),
        comicCacheService: ComicCacheService = ComicCacheProvider()
    ) {
        self.comicAPIService = comicAPIService
        self.comicCacheService = comicCacheService
    }
    
    func getAllComics(
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<[Comic], Error>) -> Void
    ) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.repository.getAllComics(fromDataSource: dataSource) { result in
                DispatchQueue.main.async {
                    complete(result.map { $0.map { Comic(from: $0) } })
                }
            }
        }
    }
    
    func getComic(
        withID comicID: String,
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<Comic, Error>) -> Void
    ) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.repository.getComic(withID: comicID, fromDataSource: dataSource) { result in
                DispatchQueue.main.async {
                    complete(result.map { Comic(from: $0) })
                }
            }
        }
    }

}
