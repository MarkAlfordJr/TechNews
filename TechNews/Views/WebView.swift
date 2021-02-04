//
//  WebView.swift
//  TechNews
//
//  Created by Mark Alford on 2/4/21.
//

import Foundation
import WebKit
import SwiftUI

//represents a ui kitView
struct WebView: UIViewRepresentable {
    let urlString: String?
    
    //used to retrieve WebView functionality
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //updates the WebView, everytime a new link is tapped
    func updateUIView(_ uiView: WKWebView, context: Context) {
            if let safeString = urlString {
                if let url = URL(string: safeString){
                    let request = URLRequest(url: url)
                    uiView.load(request)
                }
            }
    }
}
