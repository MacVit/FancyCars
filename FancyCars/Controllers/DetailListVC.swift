//
//  DetailVCViewController.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class DetailListVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var editDetails: UIBarButtonItem!
    
    @IBOutlet weak var detailICarImg: UIImageView!
    @IBOutlet weak var detailCompanyLbl: UILabel!
    @IBOutlet weak var detailModelLbl: UILabel!
    @IBOutlet weak var detailColorLbl: UILabel!
    @IBOutlet weak var detailYearLbl: UILabel!
    
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func shareItem(_ sender: Any) {
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    


}
