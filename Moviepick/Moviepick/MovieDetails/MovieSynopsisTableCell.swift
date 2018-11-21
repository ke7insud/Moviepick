//
//  MovieSynopsisTableCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 18/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieSynopsisTableCell: BaseTableViewCell {

    @IBOutlet weak var synopsis: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ movie: Movie) {
        self.synopsis.text = movie.overview
    }

}
