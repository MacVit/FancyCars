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
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        
    }
}
