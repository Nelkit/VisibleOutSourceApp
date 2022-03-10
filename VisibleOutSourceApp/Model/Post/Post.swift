//
//  Post.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

struct Post: Decodable{
    let userId, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
