//
//  Utilities.swift
//  Euphony
//
//  Created by Vinay Bharwani on 06/12/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import Foundation

class Utilities/*: NSObject */{
    
    enum MusicCategories{
//        var id: Int{
//            return self.rawValue
//        }
//        case toplists, pop, bollywood, punjabi, party, edm, hiphop, mood, workout, chill
//        
//        var title: String{
//            switch self{
//                case .toplists : return "Top Lists"
//                case .pop : return "Pop"
//                case .bollywood : return "Bollywood"
//                case .punjabi : return "Punjabi"
//                case .party : return "Party"
//                case .edm : return "EDM"
//                case .hiphop : return "Hip-Hop"
//                case .mood : return "Mood"
//                case .workout : return "Workout"
//                case .chill : return "Chill"
//            }
//        }
        static let toplists = "Top Lists"
        static let pop = "Pop"
        static let bollywood = "Bollywood"
        static let punjabi = "Punjabi"
        static let party = "Party"
        static let edm = "EDM"
        static let hiphop = "Hip-Hop"
        static let mood = "Mood"
        static let workout = "Workout"
        static let chill = "Chill"
    }
    
    private static var timeHMSFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
    
    static func formatSecondsToHMS(_ seconds: Double) -> String {
//        return timeHMSFormatter.string(from: seconds) ?? "00:00"
            return secondsToFormattedString(seconds) //?? "00:00"
    }
    private static func secondsToFormattedString(_ totalSeconds: Double) -> String{
//        let hours:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 86400) / 3600)
        guard !(totalSeconds.isNaN || totalSeconds.isInfinite) else {
            return "00:00" // or do some error handling
        }
        let minutes:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))

//        if hours > 0 {
//            return String(format: "%i:%02i:%02i", hours, minutes, seconds)
//        } else {
            return String(format: "%02i:%02i", minutes, seconds)
//        }
    }
}
