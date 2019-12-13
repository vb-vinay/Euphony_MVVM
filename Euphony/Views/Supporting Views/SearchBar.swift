//
//  SearchBar.swift
//  Euphony
//
//  Created by Vinay Bharwani on 28/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable{
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate{
        
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }

    }
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
            uiView.text = text
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
}
