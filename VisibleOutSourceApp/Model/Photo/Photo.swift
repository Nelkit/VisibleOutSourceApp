//
//  Photo.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation

struct Photo: Decodable{
    let albumId, id: Int
    let title, url, thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case thumbnailUrl = "thumbnailUrl"
        case url = "url"
    }
}
