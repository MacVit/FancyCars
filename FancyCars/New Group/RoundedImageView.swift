//
//  RoundedImageView.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Навіщо тут layoutIfNeeded()?
        layoutIfNeeded()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }

//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            layoutIfNeeded()
//            return layer.cornerRadius
//
//        }
//        set(newRadius) {
//            layer.cornerRadius = newRadius
//            layer.masksToBounds = true
//            layer.masksToBounds = newRadius > 0
//        }
//    }
    
}
