//
//  MovieCastCollectionCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 19/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieCastCollectionCell: BaseCollectionViewCell {
    @IBOutlet weak var castImage: UIImageView!
    @IBOutlet weak var castName: UILabel!
    @IBOutlet weak var workName: UILabel!
    
    func configureCell(_ cast: MovieCast) {
        
        if cast.profile_path.count > 0 {
            let url = URL(string: "\(baseImagePath)\(profileSize)\(cast.profile_path)")
            self.castImage.kf.setImage(with: url, placeholder: R.image.defaultPlaceHolder())
        } else {
            self.castImage.image = R.image.defaultPlaceHolder()
        }
        
        self.castName.text = cast.name
        self.workName.text = cast.character
        
    }
    
    func configureCell(_ crew: MovieCrew) {
        
        self.castImage.image = R.image.defaultPlaceHolder()
        let url = URL(string: "\(baseImagePath)\(profileSize)\(crew.profile_path)")
        self.castImage.kf.setImage(with: url, placeholder: R.image.defaultPlaceHolder())
        
        self.castName.text = crew.name
        self.workName.text = crew.job
        
    }
    
}
