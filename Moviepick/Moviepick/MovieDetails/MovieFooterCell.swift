//
//  MovieFooterCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 21/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieFooterCell: BaseTableViewCell {

    @IBOutlet weak var imageFooter: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageFooter.image = R.image.filmstrip()
        // Initialization code
    }

}
