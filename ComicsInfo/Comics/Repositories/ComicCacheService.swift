//
//  ComicCacheService.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol ComicCacheService {

    func getComicSummaries(
        for seriesID: String,
        afterID: String?,
        limit: Int
    ) -> [ComicSummary]?
    func save(comicSummaries: [ComicSummary], forSeriesID seriesID: String)

    func getComic(withID comicID: String) -> Comic?
    func save(comics: [Comic])

}
