//
//  AsyncImageView.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 9/3/22.
//

import Foundation
import UIKit

//MARK: - 'asyncImagesCashArray' is a global varible cashed UIImage
var asyncImagesCashArray = NSCache<NSString, UIImage>()

class AsyncImageView: UIImageView {
    
    //MARK: - Variables
    private var currentURL: NSString?
    
    //MARK: - Public Methods
    
    func loadAsyncFrom(url: String, placeholder: UIImage?, onCompletion:@escaping (_ image: UIImage)->(),onError:@escaping ()->()) {
        self.image = nil
        
        let imageURL = url as NSString
        if let cashedImage = asyncImagesCashArray.object(forKey: imageURL) {
            image = cashedImage
            onCompletion(cashedImage)
            return
        }
        
        image = placeholder
        
        currentURL = imageURL
        guard let requestURL = URL(string: url) else { image = placeholder; return }
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                if error == nil {
                    if let imageData = data {
                        if self?.currentURL == imageURL {
                            if let imageToPresent = UIImage(data: imageData) {
                                
                                asyncImagesCashArray.setObject(imageToPresent, forKey: imageURL)
                                self?.image = imageToPresent
                                onCompletion(imageToPresent)
                            } else {
                                
                                self?.image = placeholder
                                onError()
                            }
                        }
                    } else {
                        
                        self?.image = placeholder
                        onError()
                    }
                } else {
                    
                    self?.image = placeholder
                    onError()
                }
            }
            }.resume()
    }
}
