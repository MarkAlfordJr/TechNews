//
//  NetworkManager.swift
//  TechNews
//
//  Created by Mark Alford on 2/4/21.
//

import Foundation

//Observer Pattern
//o1 observableObject allows the observer pattern, which will have decoded results passed into the ContentView
class NetworkManager: ObservableObject {
    
    //o2 make var for array of parsed data, make it published so ContentView can be aware of it
    @Published var posts = [Post]()
    
    //method to fetch data from urlQuery
    func fetchData() {
        //make the url to query
        if let url = URL(string:"http://hn.algolia.com/api/v1/search?tags=front_page") {
            //create networking session
            let session = URLSession(configuration: .default)
            //create decoding session, to get back data from server
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    //create decoder
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            //have results equal PARSED json, from PostData file
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                //o3 have posts equal results
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            //start the session
            task.resume()
        }
    }
    
    
}
