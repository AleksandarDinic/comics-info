//
//  CharactersListView.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 11/05/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import SwiftUI

struct CharactersListView: View {

    @ObservedObject private var viewModel: CharacterViewModel

    init(_ viewModel: CharacterViewModel = CharacterViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            if viewModel.status == .loading {
                Text("Loading...")
                    .font(.title)
            } else {
                List(viewModel.characters, id: \.identifier) { character in
                    NavigationLink(
                        destination: Text(character.name) // SeriesListView(forCharacter: character)
                    ) {
                        CharacterView(character: CharacterPresenter(from: character))
                    }
                }
                .navigationBarTitle("Characters")
            }
        }
        .onAppear {
            viewModel.loadAllCharacters()
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text(viewModel.errorMessage))
        }
    }

}

#if DEBUG
struct CharactersListView_Previews: PreviewProvider {

    static let viewModel = CharacterViewModel(
        characters: [
            Character.make(),
            Character.make(),
            Character.make(),
            Character.make()
        ],
        status: .showCharacters
    )

    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { color in
            CharactersListView(viewModel)
                .previewDisplayName("\(color)")
                .environment(\.colorScheme, color)
        }
    }

}
#endif
