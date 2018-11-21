//
//  MovieCastTableCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 19/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class MovieCastTableCell: BaseTableViewCell {

    @IBOutlet weak var movieCastCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        movieCastCollectionView.delegate = dataSourceDelegate
        movieCastCollectionView.dataSource = dataSourceDelegate
        movieCastCollectionView.tag = row
        movieCastCollectionView.reloadData()
    }

}
