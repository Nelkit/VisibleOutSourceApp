//
//  PhotoCell.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let reuseIdentifier: String="PhotoCell"
    @IBOutlet weak var thumbnailImage: AsyncImageView!
    
    var photo : Photo? {
        didSet {
            thumbnailImage.loadAsyncFrom(url: photo!.thumbnailUrl, placeholder: #imageLiteral(resourceName: "image_placeholder.png"), onCompletion: { _ in}, onError: {})
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
