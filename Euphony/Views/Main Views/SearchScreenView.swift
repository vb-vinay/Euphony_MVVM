//
//  SearchScreenView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 12/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import WebKit

struct SearchScreenView: View {
    
    let names = ["Raju", "Ghanshyam", "Baburao Ganpatrao Apte", "Anuradha", "Kabira", "Chaman Jhinga", "Devi Prasad", "Khadak Singh"]
    @State private var searchTerm: String = ""
    
    var body: some View {

        VStack {
            NavigationView{
                List {
                    SearchBar(text: $searchTerm)

                    ForEach(self.names.filter{
                        self.searchTerm.isEmpty ? true : $0.localizedStandardContains(self.searchTerm)
                    }, id: \.self) { name in
                        Text(name)
                    }
                }

                .navigationBarTitle("Search 🔎", displayMode: .large)
            }
            Text("Welcome to Search Screen")
        }
        
    }
}




struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView().environment(\.colorScheme, .dark)
    }
}
