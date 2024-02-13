//
//  MPKeywordController.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import Foundation
import MPNetworker

public struct MPKeywordController {
    public static func getKeywords(for movieID: Int) async -> Keywords{
        guard let keywordList = try? await MPAPIClient.getKeywords(for: movieID) else {
            return Keywords()
        }
        
        return keywordList
    }
}
