//
//  CategoriesModel.swift
//  Euphony
//
//  Created by Vinay Bharwani on 02/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

struct Categories: Decodable{
    
    var categories: Category
    
    struct Category: Decodable{
        var items: [Item]
    }
    
    struct Item: Decodable{
        var name: String
        var id: String
    }
}
