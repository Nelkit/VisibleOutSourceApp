//
//  CommentCell.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import UIKit

class CommentCell: UITableViewCell {
    static let reuseIdentifier: String="CommentCell"
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var comment : Comment? {
        didSet {
            commentLabel.text = comment?.body
            emailLabel.text = comment?.email
        }
    }

    var index : Int? {
        didSet {
            updateHorizontalConstraints()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    func updateHorizontalConstraints(){
        guard let index = index else {return}
        
        if (index % 2 == 0){
            trailingConstraint.constant = 20
            leadingConstraint.constant = 50
        }else{
            leadingConstraint.constant = 20
            trailingConstraint.constant = 50
        }
    }
    
}
