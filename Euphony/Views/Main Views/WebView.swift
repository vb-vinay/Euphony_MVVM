//
//  WebView.swift
//  Euphony
//
//  Created by Vinay Bharwani on 28/11/19.
//  Copyright © 2019 Vinay Bharwani. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
} 
