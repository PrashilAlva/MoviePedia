//
//  MPVideoPlayerView.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import SwiftUI
import WebKit

struct MPVideoPlayerView: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) ->  WKWebView {
            return WKWebView()
        }
    func updateUIView(_ uiView: WKWebView, context: Context) {
            guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
            uiView.scrollView.isScrollEnabled = false
            uiView.load(URLRequest(url: demoURL))
        }
}

//#Preview {
//    MPVideoPlayerView()
//}
