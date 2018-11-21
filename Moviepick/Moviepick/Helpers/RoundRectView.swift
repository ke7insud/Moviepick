//
//  RoundRectView.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

@IBDesignable class RoundRectView: UIView {

    @IBInspectable var cornerRadius: Float = 0.0

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        DispatchQueue.main.async {
            self.layer.cornerRadius = CGFloat(self.cornerRadius)
            self.clipsToBounds = true
        }
    }

}
