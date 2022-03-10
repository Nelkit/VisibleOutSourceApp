//
//  AlbumViewModel.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//
import Foundation

class AlbumViewModel:NSObject {
    private var services : Services!
    private(set) var photos : [Photo]!{
        didSet {
            self.bindAlbumViewModelToView()
        }
    }
    var bindAlbumViewModelToView : (() -> ()) = {}
    
    override init() {
        super.init()
        self.services = Services()
    }
    
    func getAlbumByPost(postId: Int){
        self.services.getAlbumByPost(postId: postId) { (photos) in
            self.photos = photos
        }
    }
}

