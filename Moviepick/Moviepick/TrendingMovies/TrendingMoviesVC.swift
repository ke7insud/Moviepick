//
//  TrendingMoviesVC.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

var baseImagePath = ""
var profileSize = ""
var posterSize = ""
var backdropSize = ""
var genereDictionary = [Int: String]()
let appDelegate = UIApplication.shared.delegate as? AppDelegate
var movieCoreDataObjs = [MovieCoreDataObj]()
var configObj = [Configuration]()

class TrendingMoviesVC: UIViewController {
    
    @IBOutlet weak var trMoviesCollectionView: UICollectionView!
    var page = 1
    var language = "en"
    var popularMovies = [Movie]()
    var popularMoviesToStoreInCoreData = [Movie]()
    var group: DispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customizing Layout
        customizeFlowLayout()
        printSqliteFilepath()
        
        // initial fetching of the data from coreData
        fetchPopularMoviesFromCoreData()
        
        // need all three api to get desired results
        configurationAPICalled()
        popularMoviesAPICalled(true)
        getGenreData()
        
        // notifies when all API's are called
        self.group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.removeMovieList()
            self?.removeConfigList()
            self?.movieDataSavedToCoreData()
            
            DispatchQueue.main.async {
                self?.trMoviesCollectionView.reloadData()
            }
        }
    }
    
    fileprivate func customizeFlowLayout() {
        let layout = VegaScrollFlowLayout()
        trMoviesCollectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        trMoviesCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    fileprivate func printSqliteFilepath() {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
    }
}

extension TrendingMoviesVC: UICollectionViewDataSource {
    
    // here I am using R swift to compile check loose typed to strong typed
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Check if the last row number is the same as the last current data element
        if indexPath.row == self.popularMovies.count - 1 {
            self.loadMore()
        }
        
        if let trendingMoviesCollectionCell = trMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: TrendingMoviesCollectionCell.identifier, for: indexPath) as?  TrendingMoviesCollectionCell {
            trendingMoviesCollectionCell.configureCell(popularMovies[indexPath.item])
            return trendingMoviesCollectionCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(popularMovies.count)
        return popularMovies.count
    }
}

extension TrendingMoviesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movieDetailsVC = R.storyboard.main.moviedetailsvc()
        DispatchQueue.main.async {
            movieDetailsVC?.movieDetails = self.popularMovies[indexPath.row]
            self.navigationController?.pushViewController(movieDetailsVC!, animated: true)
        }
        
    }
}
