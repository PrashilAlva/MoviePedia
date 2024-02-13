//
//  MPCastAndCrewController.swift
//  MoviePedia
//
//  Created by Prashil Alva on 11/02/24.
//

import Foundation
import MPNetworker

public struct MPCastAndCrewController {
    static public func obtainCastAndCrew(for movieID: Int) async -> PersonnelList {
        guard var personnelList = try? await MPAPIClient.getCastAndCrew(for: movieID) else {
            return PersonnelList()
        }
        
        personnelList.crew = personnelList.crew.filter { crew in
            if let job = crew.job  {
                return job.elementsEqual("Director") || job.elementsEqual("Writer") || job.elementsEqual("Producer")
            }
            return false
        }
        
        return personnelList
    }
}
