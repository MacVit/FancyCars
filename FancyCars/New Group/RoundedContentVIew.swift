//
//  RoundedContentVIew.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 11/21/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class RoundedContentVIew: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 6.0
        layer.shadowOffset = CGSize(width: 3.0, height: 4.0)
        layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 0.8).cgColor
    }
}
