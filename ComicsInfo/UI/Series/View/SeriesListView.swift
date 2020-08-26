//
//  SeriesListView.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 20/07/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import SwiftUI

struct SeriesListView: View {

    @ObservedObject private var viewModel: CharactersWithSeriesViewModel

    init(_ viewModel: CharactersWithSeriesViewModel = CharactersWithSeriesViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            if viewModel.status == .loading {
                ProgressView {
                    Text("Loading...")
                        .font(.title)
                }
            } else {
                List {
                    ForEach(viewModel.characters, id: \.identifier) { character in
                        Section(header: Text(character.name)) {
                            ForEach(character.series, id: \.identifier) { series in
                                NavigationLink(
                                    destination: ComicsListView(forSeries: series)
                                ) {
                                    SeriesView(series: SeriesPresenter(from: series))
                                }

                            }
                        }
                    }
                }
                .navigationBarTitle("Discover")
            }
        }
        .onAppear {
            viewModel.loadAllSeries()
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text(viewModel.errorMessage))
        }
    }

}

#if DEBUG
struct SeriesListView_Previews: PreviewProvider {

    static let viewModel = CharactersWithSeriesViewModel(
        characters: [
            Character.flash,
            Character.spiderMan,
            Character.captainAmerica,
            Character.hulk,
            Character.ironMan,
            Character.silverSurfer,
            Character.unknown
        ],
        status: .showSeries
    )

    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            SeriesListView(viewModel)
                .previewDisplayName("\(color)")
                .environment(\.colorScheme, color)
        }
    }

}
#endif