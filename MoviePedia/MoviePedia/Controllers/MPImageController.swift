//
//  MPImageController.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import Foundation
import MPNetworker

public struct MPImageController {
    public static func obtainImages(for movieID: Int) async -> [MPImage] {
        guard let imageSet = try? await MPAPIClient.getImages(for: movieID) else {
            return []
        }
        
        var imageList = imageSet.posters + imageSet.backdrops + imageSet.backdrops
        
        // For Efficiency purpose, We will Only be displaying upto 30 Images
        if imageList.count > 30 {
            imageList = Array(imageList[0..<30])
        }
        
        return imageList
    }
}
