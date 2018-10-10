//
//  ViewController.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

class MainListVC: UIViewController {

    @IBOutlet weak var carImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionListView.delegate = self
        collectionListView.dataSource = self
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
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toDetail", for: indexPath) as! ItemViewCell
        
        return cell
    }
    
    
}

