//
//  ComicMock.swift
//  CIDataTests
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

@testable import struct Domain.Comic
@testable import struct CIData.Comic
import Foundation

struct ComicMock {

    static let cidataComics = [
        CIData.Comic(
            identifier: "1", popularity: 1, title: "Spider-Man", thumbnail: nil,
            issueNumber: nil, description: nil, format: nil,
            pageCount: nil, seriesID: ["1"], charactersID: ["1"], published: nil),
        CIData.Comic(
            identifier: "2", popularity: 2, title: "Duel to the Death with the Vulture!", thumbnail: nil,
            issueNumber: nil, description: nil, format: nil,
            pageCount: nil, seriesID: ["2"], charactersID: ["1"], published: nil),
        CIData.Comic(
            identifier: "3", popularity: 3, title: "Spider-Man Versus Doctor Octopus", thumbnail: nil,
            issueNumber: nil, description: nil, format: nil,
            pageCount: nil, seriesID: ["3"], charactersID: ["1"], published: nil)
    ]

    static let domainComics = [
        Domain.Comic(
            identifier: "1", popularity: 1, title: "Spider-Man", thumbnail: nil,
            issueNumber: nil, description: nil, variantDescription: nil, format: nil,
            pageCount: nil, variantsIdentifier: nil, collectionsIdentifier: nil,
            collectedIssuesIdentifier: nil, images: nil, seriesID: ["1"], charactersID: ["1"], published: nil),
        Domain.Comic(
            identifier: "2", popularity: 2, title: "Duel to the Death with the Vulture!", thumbnail: nil,
            issueNumber: nil, description: nil, variantDescription: nil, format: nil,
            pageCount: nil, variantsIdentifier: nil, collectionsIdentifier: nil,
            collectedIssuesIdentifier: nil, images: nil, seriesID: ["2"], charactersID: ["1"], published: nil),
        Domain.Comic(
            identifier: "3", popularity: 3, title: "Spider-Man Versus Doctor Octopus", thumbnail: nil,
            issueNumber: nil, description: nil, variantDescription: nil, format: nil,
            pageCount: nil, variantsIdentifier: nil, collectionsIdentifier: nil,
            collectedIssuesIdentifier: nil, images: nil, seriesID: ["3"], charactersID: ["1"], published: nil)
    ]

    static let comicsData = """
        [
            {
                "identifier": "1",
                "popularity": 1,
                "title": "Spider-Man",
                "seriesID": ["1"],
                "charactersID": ["1"]
            },{
                "identifier": "2",
                "popularity": 2,
                "title": "Duel to the Death with the Vulture!",
                "seriesID": ["2"],
                "charactersID": ["1"]
            },{
                "identifier": "3",
                "popularity": 3,
                "title": "Spider-Man Versus Doctor Octopus",
                "seriesID": ["3"],
                "charactersID": ["1"]
            }
        ]
    """.data(using: .utf8)

    static let comicBadData = """
        [
            {
                "identifier": "1",
                "popularity": 1,,
                "seriesID": ["1"],
                "charactersID": ["1"]
            },{
                "identifier": "2",
                "popularity": 2,
                "title": "Duel to the Death with the Vulture!",
                "seriesID": ["2"],
                "charactersID": ["1"]
            },{
                "identifier": "3",
                "popularity": 3,
                "title": "Spider-Man Versus Doctor Octopus",
                "seriesID": ["3"],
                "charactersID": ["1"]
            }
        ]
    """.data(using: .utf8)

}
