//
//  PostData.swift
//  TechNews
//
//  Created by Mark Alford on 2/4/21.
//

import Foundation

struct Results: Decodable{
    //the first level array
    let hits: [Post]
}

//vars within the JSON hits array
struct Post: Decodable, Identifiable{
    //have id equal objectID, needs id because of the Identifiable protocol
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
