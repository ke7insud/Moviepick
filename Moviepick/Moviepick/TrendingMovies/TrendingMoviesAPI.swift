//
//  TrendingMoviesAPI.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

// API's called
extension TrendingMoviesVC {
    
    public func loadMore() {
        page += 1
        popularMoviesAPICalled(false)
    }
    
    public func configurationAPICalled() {
        //https://api.themoviedb.org/3/configuration?api_key=<<api_key>>
        self.group.enter()
        let popularMovieUrl = .apiUrl + "configuration"
        let parameters: Parameters = [
            "api_key": String.apiKey
        ]
        
        Alamofire.request(popularMovieUrl, parameters: parameters ).responseJSON { [weak self] (responseData) -> Void in
            if (responseData.result.value) != nil {
                if let swiftyJsonVar = JSON(responseData.result.value!).dictionaryObject {
                    self?.group.leave()
                    if let results = swiftyJsonVar["images"] as? [String: Any] {
                        let parser = MovieParser()
                        let imageConfigFromParser = parser.parseConfigurationData(results)
                        baseImagePath = imageConfigFromParser.secure_base_url
                        backdropSize =  self?.getImageSize(imageConfigFromParser.backdrop_sizes) ?? .original
                        profileSize =  self?.getImageSize(imageConfigFromParser.profile_sizes) ?? .original
                        posterSize =  self?.getImageSize(imageConfigFromParser.poster_sizes) ?? .original
                    }
                }
            }
        }
    }
    
    public func getGenreData() {
        self.group.enter()
        let genereUrl = .apiUrl + "genre/movie/list"
        let parameters: Parameters = [
            "api_key": String.apiKey,
            "language": language
        ]
        
        Alamofire.request(genereUrl, parameters: parameters ).responseJSON { [weak self] (responseData) -> Void in
            self?.group.leave()
            if (responseData.result.value) != nil {
                if let swiftyJsonVar = JSON(responseData.result.value!).dictionaryObject {
                    if let results = swiftyJsonVar["genres"] as? [[String: Any]] {
                        let parser = MovieParser()
                        genereDictionary = parser.parseGenreData(results)
                    }
                }
            }
        }
    }
    
    public func popularMoviesAPICalled(_ IsFirstLoad: Bool) {
        self.group.enter()
        let popularMovieUrl = .apiUrl + "movie/popular"
        let parameters: Parameters = [
            "api_key": String.apiKey,
            "language": language,
            "page": page
        ]
        
        Alamofire.request(popularMovieUrl, parameters: parameters ).responseJSON { [weak self] (responseData) -> Void in
            if (responseData.result.value) != nil {
                if let swiftyJsonVar = JSON(responseData.result.value!).dictionaryObject {
                    self?.group.leave()
                    if let results = swiftyJsonVar["results"] as? [[String: Any]] {
                        let parser = MovieParser()
                        let popularMoviesFromParser = parser.parseDataForPopularMovies(results)
                        
                        // only at first Load we remove the results from core data
                        if IsFirstLoad {
                            self?.popularMovies.removeAll()
                        }
                        
                        self?.popularMovies.append(contentsOf: popularMoviesFromParser)
                        
                        // removing previous elements
                        self?.popularMoviesToStoreInCoreData.removeAll()
                        self?.popularMoviesToStoreInCoreData.append(contentsOf: popularMoviesFromParser)
                        
                        // only at first Load we remove the results from core data
                        if !IsFirstLoad {
                            
                            self?.save(completion: { (complete) in
                                if complete {
                                    print("movie data saved")
                                }
                            })
                            
                            DispatchQueue.main.async {
                                self?.trMoviesCollectionView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func getImageSize(_ sizes: [String]) -> String {
        
        var size = String.original
        if  sizes.count > 0 {
            if !sizes.contains(.original) {
                if let imageSize = sizes.first {
                    size = imageSize
                }
            }
        }
        return size
    }
}
