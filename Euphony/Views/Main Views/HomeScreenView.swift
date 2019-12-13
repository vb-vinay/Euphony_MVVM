//
//  HomeScreenView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 07/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import AVKit

struct HomeScreenView: View {
    @State private var isSettingPresented = false
    var body: some View {
        TabView(){
            NavigationView(){
                SubHomeScreenView()
                    .navigationBarItems(trailing: Button(action: {
                        self.isSettingPresented = true
                }){
                    Image("settings")
                    .resizable()
                    .frame(width: 25, height: 25)
                    }).navigationBarTitle("Music 🎧", displayMode: .automatic)
                    
                }.tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
                SearchScreenView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                WebView(request: URLRequest(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!))
                    .tabItem{
                        Image(systemName: "heart")
                        Text("Favourites")
                    }
                CategoryList(category: categories)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Categories")
                    }
//                GenresList(genres: genres)
//                    .tabItem{
//                        Image(systemName: "book")
//                        Text("Genres")
//                    }
                PlayerContainerview(player: AVPlayer(url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!))
                    .tabItem{
                        Image(systemName: "music.note")
                        Text("PlayerView")
                    }
//            PlayerContainerview(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "videoplayback", ofType: "mp4")!)))
//                    .tabItem{
//                        Image(systemName: "music.note")
//                        Text("PlayerView")
//                }
            }
        }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().environment(\.colorScheme, .dark)
    }
}
