//
//  ItemViewCell.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/9/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageOfTheCar: RoundedImageView!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.3
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
}
