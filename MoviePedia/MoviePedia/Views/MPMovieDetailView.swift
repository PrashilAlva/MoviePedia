//
//  MPMovieDetailView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 10/02/24.
//

import SwiftUI
import MPNetworker
import AVKit

struct MPMovieDetailView: View {
    @State var movieSelected: Movie
    @State var personnelList: PersonnelList
    @State var imageList: [MPImage]
    @State var videoList: VideoList
    @State var keywordsList: Keywords
    @State var appState: AppState = .loading
    @State var isReloadRequested = false
    private let currencyFormatter = NumberFormatter()
    
    var gridItemLayout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            switch appState {
            case .launched:
                ScrollView {
                    VStack(alignment: .leading) {
                        if let imageURL = URL(string: "https://image.tmdb.org/t/p/original/\(movieSelected.backdropPath ?? "")") {
                            MPCacheAsyncImage(url: imageURL) { phase in
                                switch phase {
                                case .success(let image):
                                    HStack {
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                case .failure:
                                    Image(systemName: "network.slash")
                                case .empty:
                                    ProgressView()
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .shadow(color: .secondary, radius: 10)
                            .cornerRadius(20.0)
                        }
                        VStack {
                            HStack {
                                if let imageURL = URL(string: "https://image.tmdb.org/t/p/original/\(movieSelected.posterPath)") {
                                    MPCacheAsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .success(let image):
                                            HStack {
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                            }
                                        case .failure:
                                            Image(systemName: "network.slash")
                                        case .empty:
                                            ProgressView()
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(height: 250)
                                    .shadow(color: .secondary, radius: 10)
                                    .padding(.trailing)
                                }
                                VStack(alignment: .leading) {
                                    Text(movieSelected.title)
                                        .fontWeight(.bold)
                                        .font(.system(size: movieSelected.title.count > 20 ? 20 : 25))
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(movieSelected.genres ?? []) { genre in
                                                MPCapsuleView(capsuleValue: genre.name)
                                            }
                                        }
                                    }
                                    HStack {
                                        Text(movieSelected.originalLanguage.uppercased())
                                        Text("|")
                                        Text("\(movieSelected.runtime ?? 0) mins")
                                        Text("|")
                                        Text(movieSelected.releaseDate)
                                    }
                                    .font(.system(size: 15))
                                    .fontWeight(.thin)
                                    Text(movieSelected.overview ?? "")
                                        .font(.system(size: 13))
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .padding(.trailing)
                                        Text(String(format: "%.2f", movieSelected.voteAverage))
                                            .fontWeight(.bold)
                                        Text("/10")
                                            .padding(.trailing)
                                        Text("\(movieSelected.voteCount ?? 0 / 100)K")
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.bottom)
                            VStack {
                                VStack {
                                    HStack {
                                        Text("Starring")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(personnelList.cast) { cast in
                                                MPPersonnelSummaryView(personnel: cast)
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                                VStack {
                                    HStack {
                                        Text("Top Credits")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(personnelList.crew) { crew in
                                                MPPersonnelSummaryView(personnel: crew)
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                                if movieSelected.budget ?? 0 > 0, let budget = currencyFormatter.string(from: NSNumber(value: movieSelected.budget ?? 0))  {
                                    VStack {
                                        HStack {
                                            Text("Budget")
                                                .font(.system(size: 30))
                                                .fontWeight(.bold)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(budget)
                                            Spacer()
                                        }
                                    }
                                    .padding(.bottom)
                                }
                                
                                if movieSelected.revenue ?? 0 > 0, let revenue = currencyFormatter.string(from: NSNumber(value: movieSelected.revenue ?? 0)) {
                                    VStack {
                                        HStack {
                                            Text("Grossing")
                                                .font(.system(size: 30))
                                                .fontWeight(.bold)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(revenue)
                                                .font(.system(size: 15))
                                            Spacer()
                                        }
                                    }
                                    .padding(.bottom)
                                }
                                
                                LazyVStack {
                                    HStack {
                                        Text("Images")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                            .padding(.trailing)
                                        Text("\(imageList.count)")
                                            .fontWeight(.thin)
                                            .font(.system(size: 20))
                                        Spacer()
                                    }
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(imageList) { image in
                                                if let imageURL = URL(string: "https://image.tmdb.org/t/p/original/\(image.filePath)") {
                                                    MPCacheAsyncImage(url: imageURL) { phase in
                                                        switch phase {
                                                        case .success(let image):
                                                            HStack {
                                                                image
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                            }
                                                        case .failure:
                                                            Image(systemName: "network.slash")
                                                        case .empty:
                                                            ProgressView()
                                                        @unknown default:
                                                            EmptyView()
                                                        }
                                                    }
                                                    .clipShape(Rectangle())
                                                    .frame(width: 200, height: 200)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                                
                                LazyVStack {
                                    HStack {
                                        Text("Videos")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                            .padding(.trailing)
                                        Text("\(videoList.results.count)")
                                            .fontWeight(.thin)
                                            .font(.system(size: 20))
                                        Spacer()
                                    }
                                    ScrollView(.horizontal) {
                                        HStack {
                                            ForEach(videoList.results) { video in
                                                VStack(alignment: .leading) {
                                                    MPVideoPlayerView(videoID: video.key)
                                                        .frame(width: 300, height: 200)
                                                    Text(video.name)
                                                        .font(.subheadline)
                                                        .frame(width: 200)
                                                        .frame(height: 100)
                                                }
                                                .padding()
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                                
                                VStack {
                                    HStack {
                                        Text("Keywords")
                                            .font(.system(size: 30))
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    HStack {
                                        LazyVGrid(columns: gridItemLayout, spacing: 20) {
                                            ForEach(keywordsList.keywords) { keyword in
                                                MPCapsuleView(capsuleValue: keyword.name)
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }
                            .padding(.leading)
                        }
                        .padding(.top)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                }
            case .loading:
                ProgressView()
            case .notReachable:
                MPNetworkErrorView(isReloadRequested: $isReloadRequested)
            }
        }
        .task {
            self.currencyFormatter.numberStyle = .currency
            self.currencyFormatter.currencyCode = "USD"
            self.currencyFormatter.locale = Locale(identifier: "en_US")
            await renderMovieDetails()
        }
        .onChange(of: isReloadRequested) { _, newStatus in
            if newStatus {
                self.appState = .loading
                Task {
                    await renderMovieDetails()
                }
                isReloadRequested = false
            }
        }
    }
    
    func renderMovieDetails() async {
        if let movieObtained = try? await MPAPIClient.getDetails(for: movieSelected.id) {
            self.movieSelected = movieObtained
            self.personnelList = await MPCastAndCrewController.obtainCastAndCrew(for: movieSelected.id)
            self.imageList = await MPImageController.obtainImages(for: movieSelected.id)
            self.videoList = await MPVideoController.obtainVideos(for: movieSelected.id)
            self.keywordsList = await MPKeywordController.getKeywords(for: movieSelected.id)
            self.appState = .launched
        } else {
            self.appState = .notReachable
        }
    }
}

//#Preview {
//    MPMovieDetailView()
//}
