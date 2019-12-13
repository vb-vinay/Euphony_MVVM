//
//  OutlineMenu.swift
//  Euphony
//
//  Created by Vinay Bharwani on 09/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation
//[TopLists,Pop,Bollywood,Punjabi,Romance,Party,Tamil,Electronic/Dance,Telugu,Hip-Hop,Wellness,R&B,Tastemakers,Rock,K-Pop,Indie,Reggae,Mood,Workout,Chill]
enum OutlineMenu: Int, CaseIterable, Identifiable{
    var id: Int{
        return self.rawValue
    }
    case toplists, pop, bollywood, punjabi, party, edm, hiphop, mood, workout, chill
    
    var title: String{
        switch self{
            case .toplists : return "Top Lists"
            case .pop : return "Pop"
            case .bollywood : return "Bollywood"
            case .punjabi : return "Punjabi"
            case .party : return "Party"
            case .edm : return "EDM"
            case .hiphop : return "Hip-Hop"
            case .mood : return "Mood"
            case .workout : return "Workout"
            case .chill : return "Chill"
        }
    }
//    var image: String{
//        switch self{
//            case .toplists : return "music.note"
//            case .pop : return "music.note"
//            case .bollywood : return "music.note"
//            case .punjabi : return "music.note"
//            case .party : return "music.note"
//            case .edm : return "music.note"
//            case .hiphop : return "music.note"
//            case .mood : return "music.note"
//            case .workout : return "music.note"
//            case .chill : return "music.note"
//        }
//    }
}
