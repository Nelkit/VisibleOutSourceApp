//
//  Comment.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation

struct Comment: Decodable{
    let postId, id: Int
    let name, body, email: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case id = "id"
        case name = "name"
        case body = "body"
        case email = "email"
    }
}
