//
//  GenresList.swift
//  Euphony
//
//  Created by Vinay Bharwani on 02/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct GenresList: View {
    var genres: Genres
    var body: some View {
        List(0..<genres.genres.count){ item in
            Text(self.genres.genres[item])
        }
    }
}

struct GenresList_Previews: PreviewProvider {
    static var previews: some View {
        GenresList(genres: genres)
    }
}
