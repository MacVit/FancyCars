//
//  ViewController.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

// 1. Структуризувати написання коду
// 2. Структуризувати файли
// 3. Створити LocalDataManager та перенести логіку витягування інформацію про машини на нього.
// 4. Пофіксити тап картинці в хедері
// 5. Доробити DetailsListVC

class MainListVC: UIViewController {
    
    @IBOutlet weak var cnstrCarImageHeight: NSLayoutConstraint!
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
        
        collectionListView.contentInset.top = cnstrCarImageHeight.constant
        collectionListView.scrollIndicatorInsets.top = collectionListView.contentInset.top
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        // Gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTab(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        carImage.isUserInteractionEnabled = true
        carImage.addGestureRecognizer(tapGestureRecognizer)
//        tapGestureRecognizer.delegate = self
        
    }

    
}

// MARK: - Gesture Recognizer Section

extension MainListVC: UIGestureRecognizerDelegate {
    @objc func didTab(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            let tapLocation = recognizer.location(in: self.collectionListView)
            if let tapIndexPath = self.collectionListView.indexPathForItem(at: tapLocation) {
                
                if let modelImage = carsModels?[tapIndexPath.item] {
                    
                    UIView.transition(with: carImage, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.carImage.image = UIImage.init(imageLiteralResourceName: modelImage.id)
                        self.carImage.clipsToBounds = true
                    }, completion: nil)
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
        return carsModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: toDetailIdentifier, for: indexPath) as! ItemViewCell
        let index: Int = indexPath.item
        
        // Gesture
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTab(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        cell.imageOfTheCar.isUserInteractionEnabled = true
        cell.imageOfTheCar.addGestureRecognizer(tapRecognizer)
        
        
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
        
        // Resizing Image when scrolling
        let reverceOffsetY = -(view.safeAreaInsets.top + scrollView.contentOffset.y)
        cnstrCarImageHeight.constant = max(reverceOffsetY, 80)
        
        // Hiding Nav Bar when scrolling
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
            var preferredStatusBarStyle: UIStatusBarStyle {
                return .lightContent
            }

            
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
    }
}

