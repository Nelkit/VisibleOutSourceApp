//
//  PostCell.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

import UIKit

class PostCell: UITableViewCell {
    static let reuseIdentifier: String="PostCell"
    var nc: UINavigationController!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var post : Post? {
        didSet {
            titleLabel.text = post?.title
            descriptionLabel.text = post?.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    @IBAction func goToAlbumAction(_ sender: Any) {
        guard let postId = post?.id else {return}
        let vc = UIStoryboard.init(name: Constants.storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.views.albumView) as? AlbumView
        vc?.postId = postId
        nc?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToCommentAction(_ sender: Any) {
        guard let postId = post?.id else {return}
        let vc = UIStoryboard.init(name: Constants.storyboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.views.commentView) as? CommentView
        vc?.postId = postId
        nc?.pushViewController(vc!, animated: true)
    }

}
