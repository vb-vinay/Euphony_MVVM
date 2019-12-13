//
//  RecommendedCollectionViewModel.swift
//  Euphony
//
//  Created by Vinay Bharwani on 10/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

class RecommendationCollection : ObservableObject{
    @Published var recommendation = [Recommendation]()
    init(){
        
    }
}
