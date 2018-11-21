//
//  MovieHeaderTableViewCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 17/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieHeaderTableViewCell: BaseTableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backDropImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImage.layer.shadowColor = #colorLiteral(red: 0.2229698504, green: 0.2098206426, blue: 0.2261333627, alpha: 1)
        posterImage.layer.shadowOpacity = 0.5
        posterImage.layer.shadowRadius = 4
        posterImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        posterImage.layer.masksToBounds = false
        
    }
    
    func configureCell(_ movie: Movie) {
        
        let posterURL = URL(string: "\(baseImagePath)\(posterSize)\(movie.poster_path)")
        self.posterImage.kf.setImage(with: posterURL, placeholder: R.image.moviePosterComingSoon())
        
        let backdropURL = URL(string: "\(baseImagePath)\(backdropSize)\(movie.backdrop_path)")
        self.backDropImage.kf.setImage(with: backdropURL, placeholder: R.image.backdropComingSoon())
        
    }

}
