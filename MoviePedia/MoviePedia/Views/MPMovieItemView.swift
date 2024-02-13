//
//  MPMovieItemView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 10/02/24.
//

import SwiftUI
import MPNetworker

struct MPMovieItemView: View {
    @State var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/original/\(movie.posterPath)") {
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
                .clipShape(Rectangle())
                .padding(.bottom)
                .shadow(color: .secondary, radius: 10)
                .cornerRadius(20.0)
            }
            Text(movie.title)
                .fontWeight(.bold)
                .font(.system(size: movie.title.count > 20 ? 15 : 20))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: 100)
            HStack {
                Image(systemName: "star.fill")
                    .padding(.trailing)
                Text(String(format: "%.2f", movie.voteAverage))
                    .fontWeight(.bold)
                Text("/10")
                    .padding(.trailing)
            }
        }
    }
}

//#Preview {
//    MPMovieItemView()
//}
