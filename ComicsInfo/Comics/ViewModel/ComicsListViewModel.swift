//
//  ComicsListViewModel.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 22/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class ComicsListViewModel: ObservableObject {

    enum Status: Equatable {
        case loading
        case error(message: String)
        case showComics
    }

    private var useCase: ComicUseCase
    private(set) var comics: [ComicSummary]

    @Published private(set) var status: Status {
        didSet {
            switch status {
            case let .error(message):
                showError = true
                errorMessage = message
            default:
                showError = false
                errorMessage = ""
            }
        }
    }
    @Published var showError: Bool = false
    private(set) var errorMessage: String = ""

    init(
        useCase: ComicUseCase = ComicUseCase(),
        comics: [ComicSummary] = [],
        status: Status = .loading
    ) {
        self.useCase = useCase
        self.comics = comics
        self.status = status
    }

    func loadAllComics(
        for seriesID: String,
        fromDataSource dataSource: DataSourceLayer = .memory
    ) {
        guard dataSource == .network || comics.isEmpty else { return }

        useCase.getAllComics(for: seriesID, fromDataSource: dataSource) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(comics):
                self.comics = comics.sorted { $0.popularity < $1.popularity }
                self.status = .showComics
            case let .failure(error):
                self.status = .error(message: error.localizedDescription)
            }
        }
    }
    
//    func loadComic(
//        withID comicID: String,
//        fromDataSource dataSource: DataSourceLayer = .memory
//    ) {
//        guard dataSource == .network || !comics.contains(where: { $0.identifier == comicID }) else { return }
//
//        useCase.getComic(withID: comicID, fromDataSource: dataSource) { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case let .success(comic):
//                self.comics.append(comic)
//                self.status = .showComics
//            case let .failure(error):
//                self.status = .error(message: error.localizedDescription)
//            }
//        }
//    }

}
