//
//  MPPersonnelSummaryView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import SwiftUI
import MPNetworker

struct MPPersonnelSummaryView: View {
    @State var personnel: Personnel
    
    var body: some View {
        VStack {
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/original/\(personnel.profilePath ?? "")") {
                MPCacheAsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        HStack {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    case .failure:
                        Image(systemName: "person.fill")
                            .font(.system(size: 60))
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .clipShape(Circle())
                .frame(width: 150, height: 150)
            }
            Text(personnel.name)
                .fontWeight(.bold)
                .font(.system(size: 20))
            Text(personnel.character ?? personnel.job ?? "")
                .fontWeight(.thin)
                .font(.system(size: 15))
        }
    }
}

//#Preview {
//    MPPersonnelSummaryView()
//}
