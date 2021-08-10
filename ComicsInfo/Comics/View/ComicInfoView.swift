//
//  ComicInfoView.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 09/08/2020.
//  Copyright © 2020 Aleksandar Dinic. All rights reserved.
//

import SwiftUI

struct ComicInfoView: View {

    let series: SeriesViewModel
    let comic: ComicViewModel

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ComicThumbnailView(
                        imageName: comic.thumbnail,
                        systemName: comic.thumbnailSystemName
                    )
                    .frame(height: 250)

                    VStack(spacing: 4) {
                        Spacer()
                        Text(comic.title)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .accessibility(identifier: "Title")
                        Spacer()
                        Text(comic.publishedDate)
                            .font(.caption)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .accessibility(identifier: "PublishedDate")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(height: 250)
                .padding()

                DescriptionView(description: comic.description)
                Spacer()
            }
        }
        .navigationBarTitle("\(series.title) \(comic.issue)", displayMode: .inline)
    }

}

#if DEBUG
struct ComicInfoView_Previews: PreviewProvider {
    
    static let series = Series.make()
    static let comic = Comic.make()

    static var previews: some View {
        NavigationView {
            ForEach(ColorScheme.allCases, id: \.self) { color in
                ComicInfoView(
                    series: SeriesViewModel(from: series),
                    comic: ComicViewModel(from: comic)
                )
                    .previewDisplayName("\(color)")
                    .environment(\.colorScheme, color)
            }
        }
    }

}
#endif