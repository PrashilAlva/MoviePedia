//
//  MPHomeView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 07/02/24.
//

import SwiftUI
import MPNetworker

struct MPHomeView: View {
    @State var tabSelected = 0
    @State var latestMovies: Movies
    @State var popularMovies: Movies
    @State var isMoviesLoaded = false
    
    var body: some View {
        TabView(selection: $tabSelected) {
            MPListView(movieList: latestMovies, pageTitle: "Latest")
                .padding()
                .tabItem {
                    if #available(iOS 17, *) {
                        Label("Latest", systemImage: "movieclapper")
                    } else {
                        Label("Latest", systemImage: "calendar")
                    }
                }
                .tag(0)
            MPListView(movieList: popularMovies, pageTitle: "Popular")
                .padding()
                .tabItem {
                    Label("Popular", systemImage: "trophy")
                }
                .tag(1)
        }
    }
}

//#Preview {
//    MPHomeView()
//}
