//
//  ContentView.swift
//  TechNews
//
//  Created by Mark Alford on 2/4/21.
//

import SwiftUI

struct ContentView: View {
    //o4 access the networkManager
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            //o5 have list equal published property
            List(networkManager.posts){ post in
                //make list item into a button, that navigates to the detailedView
                NavigationLink(
                    //destination is parsed JSON's url var
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            //parsed JSON's points var
                            Text(String(post.points))
                            //parsed JSON's title var
                            Text(post.title)
                        }
                    })
            }
            .navigationTitle("TechNews")
        }
        //o5 activate the urlQuery session
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
