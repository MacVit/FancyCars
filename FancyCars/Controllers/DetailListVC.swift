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
    
    // MARK: - Label Outlets
    @IBOutlet weak var detailCompanyLbl: UILabel!
    @IBOutlet weak var detailModelLbl: UILabel!
    @IBOutlet weak var detailColorLbl: UILabel!
    @IBOutlet weak var detailYearLbl: UILabel!
    
    // MARK: - TextField Outlets
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func shareItem(_ sender: Any) {
        <#code#>
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        <#code#>
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        <#code#>
    }
}
