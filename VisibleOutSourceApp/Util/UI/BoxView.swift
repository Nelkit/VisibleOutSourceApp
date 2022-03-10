//
//  Box.swift
//  VisibleOutSourceApp
//
//  Created by Nelkit Chavez on 8/3/22.
//

import UIKit
import Foundation

@IBDesignable
class BoxView: UIView {

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var overflowHidden: Bool = false {
        didSet {
            layer.masksToBounds = overflowHidden
        }
    }

    @IBInspectable var elevate: Double = 0 {
        didSet {
            self.setElevate(elevation: elevate, color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8))
        }
    }
}

