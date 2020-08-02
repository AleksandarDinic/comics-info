//
//  SeriesViewModel.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 20/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import enum CIData.DataSourceLayer
import Foundation

final class SeriesViewModel: ObservableObject {

    enum Status: Equatable {
        case loading
        case error(message: String)
        case showSeries
    }

    private var seriesUseCaseAdapter: SeriesUseCaseAdapter
    private(set) var series: [Series]

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
        seriesUseCaseAdapter: SeriesUseCaseAdapter = SeriesUseCaseAdapter(),
        series: [Series] = [],
        status: Status = .loading
    ) {
        self.seriesUseCaseAdapter = seriesUseCaseAdapter
        self.series = series
        self.status = status
    }

    func loadAllSeries(
        forCharacterID characterID: String,
        fromDataSource dataSource: CIData.DataSourceLayer = .memory
    ) {
        guard dataSource == .network || series.filter({ $0.charactersID.contains(characterID) }).isEmpty else { return }

        seriesUseCaseAdapter.getAllSeries(
            forCharacterID: characterID,
            fromDataSource: dataSource
        ) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(series):
                self.series = series.sorted { $0.popularity < $1.popularity }
                self.status = .showSeries
            case let .failure(error):
                self.status = .error(message: error.localizedDescription)
            }
        }
    }

}
