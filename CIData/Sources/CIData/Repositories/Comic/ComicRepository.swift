//
//  ComicRepository.swift
//  CIData
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import struct Domain.Comic
import Foundation

public protocol ComicRepository {

    var comicDataProvider: ComicDataProvider { get }

    init(comicDataProvider: ComicDataProvider)

    /// Gets comics
    ///
    /// - Parameters:
    ///   - seriesID: Series ID
    ///   - dataSource: Layer of data source
    ///   - complete: Result who contains Comics in Success, or Error in Failure.
    func getComics(
        forSeriesID seriesID: String,
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<[Domain.Comic], Error>) -> Void
    )

}