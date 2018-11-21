//
//  MovieDetailsParser.swift
//  Moviepick
//
//  Created by SCMobileInnov on 19/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieDetailsParser: NSObject {
    
    func parseDataForCast(_ cast: [[String: Any]]) -> [MovieCast] {
        
        var movieCastArr = [MovieCast]()
        for singleCast in cast {
            var movieCast = MovieCast()
            movieCast.cast_id = (singleCast["cast_id"] as? Int) ?? -1
            movieCast.character = (singleCast["character"] as? String) ?? ""
            movieCast.credit_id = (singleCast["credit_id"] as? String) ?? ""
            movieCast.gender = (singleCast["gender"] as? Int) ?? -1
            movieCast.id = (singleCast["id"] as? Int) ?? -1
            movieCast.name = (singleCast["name"] as? String) ?? ""
            movieCast.order = (singleCast["order"] as? Int) ?? -1
            movieCast.profile_path = (singleCast["profile_path"] as? String) ?? ""
            movieCastArr.append(movieCast)
        }
        return movieCastArr
    }
    
    func parseDataForCrew(_ crew: [[String: Any]]) -> [MovieCrew] {
        
        var movieCrewArr = [MovieCrew]()
        for singleCrew in crew {
            var movieCrew = MovieCrew()
            movieCrew.credit_id = (singleCrew["credit_id"] as? String) ?? ""
            movieCrew.department = (singleCrew["department"] as? String) ?? ""
            movieCrew.gender = (singleCrew["gender"] as? Int) ?? -1
            movieCrew.id = (singleCrew["id"] as? Int) ?? -1
            movieCrew.job = (singleCrew["job"] as? String) ?? ""
            movieCrew.name = (singleCrew["name"] as? String) ?? ""
            movieCrew.profile_path = (singleCrew["profile_path"] as? String) ?? ""
            movieCrewArr.append(movieCrew)
        }
        return movieCrewArr
    }
    
}
