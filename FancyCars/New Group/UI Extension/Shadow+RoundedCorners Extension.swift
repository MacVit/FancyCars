//
//  Shadow+RoundedCorners Extension.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/10/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

extension CALayer {
    func roundedCorners(radius: CGFloat) {
        cornerRadius = radius
    }
    
    func addShadow() {
        shadowOffset = .zero
        shadowOpacity = 0.2
        shadowRadius = 15
        shadowColor = UIColor.black.cgColor
        masksToBounds = false
    }
    
    
    
}
