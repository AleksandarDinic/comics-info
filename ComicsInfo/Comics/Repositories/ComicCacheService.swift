//
//  ComicCacheService.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol ComicCacheService {

    func getAllComics(for seriesID: String) -> [ComicSummary]?
    func save(comicSummaries: [String: [ComicSummary]])

    func getComic(withID comicID: String) -> Comic?
    func save(comics: [Comic])

}
