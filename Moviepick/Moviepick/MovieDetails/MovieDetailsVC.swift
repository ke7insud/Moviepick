//
//  MovieDetailsVC.swift
//  Moviepick
//
//  Created by SCMobileInnov on 17/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum MovieDetails: CaseIterable {
    case header, basicDetails, synopsis, castHeader, cast, crewHeader, crew, footer
}

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var topViewTop: NSLayoutConstraint!
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
    
    var movieCastNCrewPlaceholderDataCount = 4
    var movieCast = [MovieCast]()
    var movieCrew = [MovieCrew]()
    var movieDetails = Movie()
    @IBOutlet weak var topView: UIView!
    var headerSize: CGFloat = 285
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topInset = UIApplication.shared.statusBarFrame.size.height
        self.movieDetailsTableView.contentInset = UIEdgeInsets(top: -topInset, left: 0, bottom: 0, right: 0)
        
        topViewTop.constant = -topInset
        tableViewTop.constant = -topInset
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        topViewHeight.constant = topBarHeight
        
        // placeholder data for cast
        for _ in stride(from: 0, to: movieCastNCrewPlaceholderDataCount, by: 1) {
            movieCast.append(MovieCast())
            movieCrew.append(MovieCrew())
        }
        
        movieCastNCrewAPICalled(movieDetails.id)
        
        // Set automatic dimensions for row height
        movieDetailsTableView.rowHeight = UITableView.automaticDimension
        movieDetailsTableView.estimatedRowHeight = 180
    }
    
    @IBAction func DidTappedOnBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}

// MARK: - UITableViewDataSource Methods
extension MovieDetailsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch MovieDetails.allCases[indexPath.row] {
        case .header:
            if let movieHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: MovieHeaderTableViewCell.identifier, for: indexPath) as? MovieHeaderTableViewCell {
                movieHeaderTableViewCell.configureCell(movieDetails)
                return movieHeaderTableViewCell
            }
            
        case .basicDetails:
            if let movieDetailsTableCell = tableView.dequeueReusableCell(withIdentifier: MovieDetailsTableCell.identifier, for: indexPath) as? MovieDetailsTableCell {
                movieDetailsTableCell.configureCell(movieDetails)
                return movieDetailsTableCell
            }
            
        case .synopsis:
            if let movieSynopsisTableCell = tableView.dequeueReusableCell(withIdentifier: MovieSynopsisTableCell.identifier, for: indexPath) as? MovieSynopsisTableCell {
                movieSynopsisTableCell.configureCell(movieDetails)
                return movieSynopsisTableCell
            }
            
        case .castHeader, .crewHeader:
            if let movieCastNCrewHeaderCell = tableView.dequeueReusableCell(withIdentifier: MovieCastNCrewHeaderCell.identifier, for: indexPath) as? MovieCastNCrewHeaderCell {
                movieCastNCrewHeaderCell.configureCell(MovieDetails.allCases[indexPath.row])
                return movieCastNCrewHeaderCell
            }
            
        case .cast, .crew:
            if let movieCastTableCell = tableView.dequeueReusableCell(withIdentifier: MovieCastTableCell.identifier, for: indexPath) as? MovieCastTableCell {
                movieCastTableCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
                return movieCastTableCell
            }
            
        case .footer:
            if let movieFooterCell = tableView.dequeueReusableCell(withIdentifier: MovieFooterCell.identifier, for: indexPath) as? MovieFooterCell {
                return movieFooterCell
            }
            
        }
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieDetails.allCases.count
    }
}

// MARK: - UITableViewDelegate Methods
extension MovieDetailsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch MovieDetails.allCases[indexPath.row] {
        case .header:
            return headerSize
            
        case .basicDetails, .synopsis:
            return UITableView.automaticDimension
            
        case .cast, .crew:
            return 230
            
        case .castHeader, .crewHeader:
            return 44
            
        case .footer:
            return 50
            
        }
    }
}

// MARK: - UICollectionViewDataSource Methods
extension MovieDetailsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch MovieDetails.allCases[collectionView.tag] {
        case MovieDetails.cast:
            if let movieCastCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCastCollectionCell.identifier, for: indexPath) as?  MovieCastCollectionCell {
                movieCastCollectionCell.configureCell(movieCast[indexPath.item])
                return movieCastCollectionCell
            }
            
        case MovieDetails.crew :
            if let movieCastCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCastCollectionCell.identifier, for: indexPath) as?  MovieCastCollectionCell {
                movieCastCollectionCell.configureCell(movieCrew[indexPath.item])
                return movieCastCollectionCell
            }
            
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch MovieDetails.allCases[collectionView.tag] {
        case MovieDetails.cast:
            return movieCast.count != 0 ? movieCast.count : movieCastNCrewPlaceholderDataCount
            
        case MovieDetails.crew :
            return movieCrew.count != 0 ? movieCrew.count : movieCastNCrewPlaceholderDataCount
            
        default:
            return 0
        }
    }
}

// MARK: - UICollectionViewDelegate Methods
extension MovieDetailsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 99, height: 230)
    }
}

extension MovieDetailsVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.movieDetailsTableView.contentOffset.y >= headerSize - 100 {
            self.topView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        } else {
            self.topView.backgroundColor = UIColor.clear
            
        }
    }
}
