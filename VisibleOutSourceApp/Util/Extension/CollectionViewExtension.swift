//
//  CollectionViewExtension.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func setLoadingView() {
        let spinner = UIActivityIndicatorView()
        spinner.center = self.center
        spinner.startAnimating()
        self.backgroundView = spinner
    }

    func removeLoadingView() {
        self.backgroundView = nil
    }
    
}
