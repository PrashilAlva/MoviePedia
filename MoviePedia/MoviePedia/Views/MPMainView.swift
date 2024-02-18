//
//  ContentView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 07/02/24.
//

import SwiftUI
import MPNetworker

struct MPMainView: View {
    @State var appState: AppState = .loading
    @State var popularMovies = Movies()
    @State var latestMovies = Movies()
    @State var isReloadRequested = false
    
    var body: some View {
        VStack {
            switch appState {
            case .launched:
                MPHomeView(latestMovies: latestMovies, popularMovies: popularMovies)
            case .loading:
                MPLaunchView()
            case .notReachable:
                MPNetworkErrorView(isReloadRequested: $isReloadRequested)
            }
        }
        .animation(.easeInOut, value: appState)
        .task {
            await setUpData()
        }
        .onChange(of: isReloadRequested) { newStatus in
            if newStatus {
                self.appState = .loading
                Task {
                    await setUpData()
                }
                isReloadRequested = false
            }
        }
    }
    
    func setUpData() async {
        if let lMovies = try? await MPAPIClient.obtainLatestMovies(), let pMovies = try? await MPAPIClient.obtainPopularMovies() {
            self.latestMovies = lMovies
            self.popularMovies = pMovies
            self.appState = .launched
        } else {
            self.appState = .notReachable
        }
    }
}

//#Preview {
//    MPMainView()
//}
