//
//  TrendingMoviesCollectionCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit
import Kingfisher

class TrendingMoviesCollectionCell: BaseCollectionViewCell {

    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var movieTimeLbl: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var ratingViewShadow: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTime: UIView!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var shadowView: UIView!

    override func awakeFromNib() {

        self.layer.shadowColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5048690581)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.masksToBounds = false

        shadowView.layer.shadowColor = #colorLiteral(red: 0.2229698504, green: 0.2098206426, blue: 0.2261333627, alpha: 1)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 8
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.masksToBounds = false

//        ratingViewShadow.layer.shadowColor = #colorLiteral(red: 0.2229698504, green: 0.2098206426, blue: 0.2261333627, alpha: 1)
//        ratingViewShadow.layer.shadowOpacity = 0.5
//        ratingViewShadow.layer.shadowRadius = 20
//        ratingViewShadow.layer.shadowOffset = CGSize(width: 0, height: 15)
//        ratingViewShadow.layer.masksToBounds = false

    }
    
    func configureCell(_ movie: Movie) {
        
        self.movieName.text = movie.title
        let url = URL(string: "\(baseImagePath)\(posterSize)\(movie.poster_path)")
        self.movieImage.kf.setImage(with: url, placeholder: R.image.moviePosterComingSoon())
        self.ratingLbl.text = String(movie.vote_average)
        self.synopsis.text = movie.overview
        self.movieTimeLbl.text = movie.release_date
        
        var genres = [String]()
        for genreId in movie.genre_ids {
            if let genreString = genereDictionary[genreId] {
                genres.append(genreString)
            }
        }
        movieGenre.text =  genres.joined(separator: ", ")
        
    }

}
