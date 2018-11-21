//
//  PopularMovies.swift
//  Moviepick
//
//  Created by SCMobileInnov on 16/11/18.
//  Copyright © 2018 popcorntime. All rights reserved.
//

import Foundation

struct Movie {

    var vote_count: Int = -1
    var id: Int = -1
    var video: Bool = false
    var vote_average: Double = -1
    var title: String = ""
    var popularity: Double = -1
    var poster_path: String = ""
    var original_language: String = ""
    var original_title: String = ""
    var genre_ids: [Int] = []
    var backdrop_path: String = ""
    var adult: Bool = false
    var overview: String = ""
    var release_date: String = ""
}
