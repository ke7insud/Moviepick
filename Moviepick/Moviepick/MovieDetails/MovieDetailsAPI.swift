//
//  MovieDetailsAPI.swift
//  Moviepick
//
//  Created by SCMobileInnov on 19/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension MovieDetailsVC {
    
    public func movieCastNCrewAPICalled(_ movieId: Int) {
        
        let popularMovieUrl = .apiUrl + "movie/\(movieId)/credits"
        let parameters: Parameters = [
            "api_key": String.apiKey
        ]
        
        Alamofire.request(popularMovieUrl, parameters: parameters ).responseJSON { [weak self] (responseData) -> Void in
            if (responseData.result.value) != nil {
                if let swiftyJsonVar = JSON(responseData.result.value!).dictionaryObject {
                    let parser = MovieDetailsParser()
                    if let results = swiftyJsonVar["cast"] as? [[String: Any]] {
                        self?.movieCast.removeAll()
                        self?.movieCast = parser.parseDataForCast(results)
                    }
                    
                    if let results = swiftyJsonVar["crew"] as? [[String: Any]] {
                        self?.movieCrew.removeAll()
                        self?.movieCrew = parser.parseDataForCrew(results)
                    }
                    self?.movieDetailsTableView.reloadData()
                }
            }
        }
    }

}
