//
//  CommentViewModel.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation

class CommentViewModel:NSObject {
    private var services : Services!
    private(set) var comments : [Comment]!{
        didSet {
            self.bindCommentViewModelToView()
        }
    }
    private var originalComments : [Comment]!
    var bindCommentViewModelToView : (() -> ()) = {}
    
    override init() {
        super.init()
        self.services = Services()
    }
    
    func getCommentsByPost(postId: Int){
        self.services.getCommentsByPost(postId: postId) { (comments) in
            self.comments = comments
            self.originalComments = comments
        }
    }
    
    func searchComment(text: String){
        comments = originalComments.filter{ comment in
            let commentBody = comment.body.lowercased()
            return commentBody.contains(text.lowercased())
        }
    }
    
    func setOriginalComments(){
        comments = originalComments
    }
}
