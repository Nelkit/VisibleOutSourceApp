//
//  TableViewExtension.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func setLoadingView() {
        let spinner = UIActivityIndicatorView()
        spinner.frame = self.frame
        spinner.startAnimating()
        self.backgroundView = spinner
    }

    func removeLoadingView() {
        self.backgroundView = nil
    }
    
}
