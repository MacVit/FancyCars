//
//  ItemViewCell.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/9/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageOfTheCar: RoundedImageView!
    
    // MARK: - Label Outlets
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 0.3
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
}
