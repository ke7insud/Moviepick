//
//  Constants.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import UIKit

extension String {
    public static let apiUrl = "https://api.themoviedb.org/3/"
    public static let apiKey = "f24fb092292486c66a0b2a5dc8b2d81b"
    public static let original = "original"
}

extension UINavigationController: UIGestureRecognizerDelegate {
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
    
}
