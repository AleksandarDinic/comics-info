//
//  ComicMock.swift
//  CIDataTests
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct ComicMock {

    static let comics = """
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
