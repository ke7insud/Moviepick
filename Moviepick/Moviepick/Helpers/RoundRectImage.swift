//
//  RoundRectImage.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

@IBDesignable class RoundRectImage: UIImageView {

    @IBInspectable var cornerRadius: Float = 0.0
    @IBInspectable var borderWidth: Float = 1.0
    @IBInspectable var borderColor: UIColor?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        DispatchQueue.main.async {
            self.layer.cornerRadius = CGFloat(self.cornerRadius)
            self.layer.borderWidth = CGFloat(self.borderWidth)
            self.layer.borderColor = self.borderColor?.cgColor ?? UIColor.clear.cgColor
            self.clipsToBounds = true
        }
    }
}
