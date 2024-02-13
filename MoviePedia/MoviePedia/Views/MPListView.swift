//
//  MPListView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 07/02/24.
//

import SwiftUI
import MPNetworker

struct MPListView: View {
    @State var movieList: Movies
    @State var pageTitle: String
    
    private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text(pageTitle)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                    Spacer()
                }
                ScrollView {
                    LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                        ForEach(movieList.results) { movie in
                            NavigationLink {
                                MPMovieDetailView(movieSelected: movie, personnelList: PersonnelList(), imageList: [], videoList: VideoList(), keywordsList: Keywords())
                            } label: {
                                MPMovieItemView(movie: movie)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    MPListView()
//}
