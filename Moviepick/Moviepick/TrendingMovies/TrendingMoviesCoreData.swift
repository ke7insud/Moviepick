//
//  TrendingMoviesCoreData.swift
//  Moviepick
//
//  Created by SCMobileInnov on 20/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import CoreData

// Core Data Functions
extension TrendingMoviesVC {
    
    func removeMovieList() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieCoreDataObj")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try managedContext.execute(deleteRequest)
            try managedContext.save()
        } catch {
            print ("There was an error")
        }
    }
    
    func removeConfigList() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Configuration")
        let deleteConfigRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try managedContext.execute(deleteConfigRequest)
            try managedContext.save()
        } catch {
            print ("There was an error")
        }
    }
    
    fileprivate func saveConfig(completion: (_ finished: Bool) -> Void) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let configObj = Configuration(context: managedContext)
        configObj.backdropSize = backdropSize
        configObj.baseImagePath = baseImagePath
        configObj.posterSize = posterSize
        configObj.profileSize = profileSize
        configObj.genereDictionary = genereDictionary
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Couldn't save the configuration Data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func save(completion: (_ finished: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        for movies in self.popularMoviesToStoreInCoreData {
            let movieObj = MovieCoreDataObj(context: managedContext)
            movieObj.adult = movies.adult
            movieObj.backdrop_path = movies.backdrop_path
            movieObj.id = Int32(movies.id)
            movieObj.original_language = movies.original_language
            movieObj.original_title = movies.original_title
            movieObj.overview = movies.overview
            movieObj.popularity = movies.popularity
            movieObj.poster_path = movies.poster_path
            movieObj.release_date = movies.release_date
            movieObj.title = movies.title
            movieObj.video = movies.video
            movieObj.vote_average = movies.vote_average
            movieObj.vote_count = Int32(movies.vote_count)
            movieObj.genreIdsArray = movies.genre_ids
            
            do {
                try managedContext.save()
                completion(true)
            } catch {
                debugPrint("Couldn't save the items \(error.localizedDescription)")
                completion(false)
            }
            
        }
        
    }
    
    fileprivate func fetch(completion: (_ complete: Bool) -> Void) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let fetchRequest = NSFetchRequest<MovieCoreDataObj>(entityName: "MovieCoreDataObj")
        
        do {
            movieCoreDataObjs = try managedContext.fetch(fetchRequest)
            debugPrint("succesfully fetched data")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch the items \(error.localizedDescription)")
            completion(false)
        }
        
        let fetchRequestConfig = NSFetchRequest<Configuration>(entityName: "Configuration")
        do {
            configObj = try managedContext.fetch(fetchRequestConfig)
            debugPrint("succesfully fetched data for config")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch the items for config \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    func fetchPopularMoviesFromCoreData() {
        self.fetch { (complete) in
            if complete {
                print("movie data fetches \([movieCoreDataObjs.count)")
                let movieParser = MovieParser()
                popularMovies = movieParser.parseDataForPopularMoviesFromCoreDataObj(movieCoreDataObjs)
                
                baseImagePath = configObj.first?.baseImagePath ?? ""
                profileSize = configObj.first?.profileSize ?? ""
                posterSize = configObj.first?.posterSize ?? ""
                backdropSize = configObj.first?.backdropSize ?? ""
                genereDictionary = configObj.first?.genereDictionary ?? [Int: String]()
                
                self.trMoviesCollectionView.reloadData()
            }
        }
    }
    
    func movieDataSavedToCoreData() {
        self.save(completion: { (complete) in
            if complete {
                print("movie data saved")
            }
        })
        
        self.saveConfig { (complete) in
            if complete {
                print("config data saved")
            }
        }
    }
}
