//
//  Services.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//
import Foundation

class Services :  NSObject {
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    
    func getPostList(completion : @escaping ([Post]) -> ()){
        guard let postURL = URL(string: "\(baseURL)posts") else { return }
        
        URLSession.shared.dataTask(with: postURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let posts = try! jsonDecoder.decode(Array<Post>.self, from: data)
                completion(posts)
            }
        }.resume()
    }
    
    func getCommentsByPost(postId: Int, completion : @escaping ([Comment]) -> ()){
        guard let postURL = URL(string: "\(baseURL)posts/\(postId)/comments") else { return }
        
        URLSession.shared.dataTask(with: postURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let comments = try! jsonDecoder.decode(Array<Comment>.self, from: data)
                completion(comments)
            }
        }.resume()
    }
    
    func getAlbumByPost(postId: Int, completion : @escaping ([Photo]) -> ()){
        guard let postURL = URL(string: "\(baseURL)posts/\(postId)/photos") else { return }
        
        URLSession.shared.dataTask(with: postURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let photos = try! jsonDecoder.decode(Array<Photo>.self, from: data)
                completion(photos)
            }
        }.resume()
    }
}
