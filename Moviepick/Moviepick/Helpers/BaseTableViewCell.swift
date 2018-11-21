//
//  BaseTableViewCell.swift
//  Moviepick
//
//  Created by SCMobileInnov on 17/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
