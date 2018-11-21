//
//  MovieParser.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieParser: NSObject {

    func parseDataForPopularMovies(_ movies: [[String: Any]]) -> [Movie] {

        var moviesModels = [Movie]()
        for movie in movies {
            moviesModels.append(parseDataForSingleMovie(movie))
        }
        return moviesModels
    }

    func parseDataForSingleMovie(_ movie: [String: Any]) -> Movie {
        
        var movieModel = Movie()
        
        movieModel.vote_count = (movie["vote_count"] as? Int) ?? -1
        movieModel.id = (movie["id"] as? Int) ?? -1
        movieModel.video = (movie["video"] as? Bool) ?? false
        movieModel.vote_average = (movie["vote_average"] as? Double) ?? -1
        movieModel.title = (movie["title"] as? String) ?? ""
        movieModel.popularity = (movie["popularity"] as? Double) ?? -1
        movieModel.poster_path = (movie["poster_path"] as? String) ?? ""
        movieModel.original_language = (movie["original_language"] as? String) ?? ""
        movieModel.original_title = (movie["original_title"] as? String) ?? ""
        movieModel.genre_ids = (movie["genre_ids"] as? [Int]) ?? []
        movieModel.backdrop_path = (movie["backdrop_path"] as? String) ?? ""
        movieModel.adult = (movie["adult"] as? Bool) ?? false
        movieModel.overview = (movie["overview"] as? String) ?? ""
        movieModel.release_date = (movie["release_date"] as? String) ?? ""
        
        return movieModel
    }
    
    func parseDataForPopularMoviesFromCoreDataObj(_ movies: [MovieCoreDataObj]) -> [Movie] {
        
        var moviesModels = [Movie]()
        for movie in movies {
            moviesModels.append(parseDataForSingleMovieFromCoreDataObj(movie))
        }
        return moviesModels
    }
    
    func parseDataForSingleMovieFromCoreDataObj(_ movieObj: MovieCoreDataObj) -> Movie {
        
        var movie = Movie()
        movie.adult = movieObj.adult
        movie.backdrop_path = movieObj.backdrop_path ?? ""
        movie.id = Int(movieObj.id)
        movie.original_language = movieObj.original_language ?? ""
        movie.original_title = movieObj.original_title ?? ""
        movie.overview = movieObj.overview ?? ""
        movie.popularity = movieObj.popularity
        movie.poster_path = movieObj.poster_path ?? ""
        movie.release_date = movieObj.release_date ?? ""
        movie.title = movieObj.title ?? ""
        movie.video = movieObj.video
        movie.vote_average = movieObj.vote_average
        movie.vote_count = Int(movieObj.vote_count)
        movie.genre_ids = movieObj.genreIdsArray ?? []
        return movie
    }
    
    func parseConfigurationData(_ config: [String: Any]) -> Images {
        
        var imagesModel = Images()
        
        imagesModel.base_url = (config["base_url"] as? String) ?? ""
        imagesModel.secure_base_url = (config["secure_base_url"] as? String) ?? ""
        imagesModel.backdrop_sizes = (config["backdrop_sizes"] as? [String]) ?? []
        imagesModel.logo_sizes = (config["logo_sizes"] as? [String]) ?? []
        imagesModel.poster_sizes = (config["poster_sizes"] as? [String]) ?? []
        imagesModel.profile_sizes = (config["profile_sizes"] as? [String]) ?? []
        imagesModel.still_sizes = (config["still_sizes"] as? [String]) ?? []
        
        return imagesModel
        
    }
    
    func parseGenreData(_ genres: [[String: Any]]) -> [Int: String] {
        
        var genreDictionary = [Int: String]()
        for genre in genres {
            if let id = genre["id"] as? Int, let name = genre["name"] as? String {
                genreDictionary[id] = name
            }
        }
        return genreDictionary
    }

}
