//
//  MovieCastNCrewHeaderCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 21/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieCastNCrewHeaderCell: BaseTableViewCell {

    @IBOutlet weak var movieCastLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ movieDetails: MovieDetails) {
        
        switch movieDetails {
        case .castHeader:
            movieCastLbl.text = "Cast"
            
        case .crewHeader:
            movieCastLbl.text = "Crew"
            
        default:
            break
        }
        
    }

}
