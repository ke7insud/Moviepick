//
//  MovieDetailsTableCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 18/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieDetailsTableCell: BaseTableViewCell {

    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var genreDetails: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ movie: Movie) {
        
        self.movieRelease.text = movie.release_date
        self.movieName.text = movie.title
        
        var genres = [String]()
        for genreId in movie.genre_ids {
            if let genreString = genereDictionary[genreId] {
                genres.append(genreString)
            }
        }
        genreDetails.text =  genres.joined(separator: ", ")
        
        ratingLabel.text = String(movie.vote_average)
        cosmosView.rating = movie.vote_average/2
    }

}
