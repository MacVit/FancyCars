//
//  ViewController.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class MainListVC: UIViewController {
    
    typealias CarsModelDescription = [CarModelDescription]
    
    private let toDetailIdentifier: String = "toDetail"
    
    var carsModels: CarsModelDescription?
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var collectionListView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionListView.delegate = self
        collectionListView.dataSource = self
        
        if let dataPath = Bundle.main.path(forResource: "data", ofType: "plist"), let carsData = NSDictionary(contentsOfFile: dataPath) {
            for(_ , value) in carsData {
                
                let arrList = value as! NSArray
                
//                arrList.forEach { (dict) in
//                    print("\(dict["model"] as! String)")
//                }
                for items in arrList {
                    let dictItems = items as! NSDictionary
                    print(dictItems)
                    for item in dictItems {
                        print(item)
                    }
                }
                
            }
            
        }
    }
}

extension MainListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension MainListVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: toDetailIdentifier, for: indexPath) as! ItemViewCell
        
        return cell
    }
    
    
}

