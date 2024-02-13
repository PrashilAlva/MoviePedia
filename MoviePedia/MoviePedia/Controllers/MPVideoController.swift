//
//  MPVideoController.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import Foundation
import MPNetworker

public struct MPVideoController {
    public static func obtainVideos(for movieID: Int) async -> VideoList {
        guard var videoList = try? await MPAPIClient.getVideos(for: movieID) else {
            return VideoList()
        }
        
        // We will be filtering Only YouTube Videos and Considering Only first 10 Videos (For Efficiency)
        videoList.results = videoList.results.filter { video in
            video.site.elementsEqual("YouTube")
        }
        
        videoList.results = videoList.results.count > 10 ? Array(videoList.results[0..<10]) : videoList.results
        
        return videoList
    }
}
