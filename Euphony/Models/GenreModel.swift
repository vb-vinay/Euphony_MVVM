//
//  GenreModel.swift
//  Euphony
//
//  Created by Vinay Bharwani on 02/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

struct Genres: Identifiable,Decodable{
    let id : Int
    var genres: [String]
}
