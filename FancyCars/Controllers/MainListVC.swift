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
    
    
    func parseCarModel() -> CarsModelDescription? {
        let url: URL = Bundle.main.url(forResource: "data", withExtension: "plist")!
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let result = try decoder.decode(CarsModelDescription.self, from: data)
            
            return result.shuffled()
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionListView.delegate = self
        collectionListView.dataSource = self
        
        
        carsModels = parseCarModel()
        
    }
}

extension MainListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let modelImage = carsModels?[indexPath.item] {
            
            UIView.transition(with: carImage, duration: 1, options: .transitionCrossDissolve, animations: {
                self.carImage.image = UIImage.init(imageLiteralResourceName: modelImage.id)
            }, completion: nil)
        }
    }
    
}

extension MainListVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: toDetailIdentifier, for: indexPath) as! ItemViewCell
        let index: Int = indexPath.item
        
        if let model = carsModels?[index] {
            cell.companyLbl.text = model.company
            cell.modelLbl.text = model.model
            cell.colorLbl.text = model.color
            cell.yearLbl.text = model.year
            cell.imageOfTheCar.image = UIImage.init(imageLiteralResourceName: model.id)
        }

        
        return cell
    }
    
    
}

extension MainListVC: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        carImage.clipsToBounds = true
        collectionListView.contentInset = UIEdgeInsets(top: 234, left: 0, bottom: 0, right: 0)
        let currentValueWhenScrolling = 234 - (scrollView.contentOffset.y + 234)
        let maxImaageHeight = max(60, currentValueWhenScrolling)
        print(maxImaageHeight)
        let desiredImageRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: maxImaageHeight)
        carImage.frame = desiredImageRect
    }
}

