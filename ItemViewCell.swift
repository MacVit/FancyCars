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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 6.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 0.1).cgColor
    }
}
