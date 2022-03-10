//
//  PostViewModel.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

import Foundation

class PostViewModel:NSObject {
    private var services : Services!
    private(set) var posts : [Post]!{
        didSet {
            self.bindPostViewModelToView()
        }
    }
    private var originalPosts : [Post]!
    var bindPostViewModelToView : (() -> ()) = {}
    
    override init() {
        super.init()
        self.services = Services()
        getPostList()
    }
    
    func getPostList(){
        self.services.getPostList { (posts) in
            self.posts = posts
            self.originalPosts = posts
        }
    }
    
    func searchPost(text: String){
        posts = originalPosts.filter{ post in
            let postTitle = post.title.lowercased()
            let postBody = post.body.lowercased()
            return postBody.contains(text.lowercased()) || postTitle.contains(text.lowercased())
        }
    }
    
    func setOriginalPosts(){
        posts = originalPosts
    }
    
}
