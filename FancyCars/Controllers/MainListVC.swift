//
//  ViewController.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/8/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import UIKit

// 1. Структуризувати написання коду + -
// 2. Структуризувати файли +
// 3. Створити LocalDataManager та перенести логіку витягування інформацію про машини на нього. +
// 4. Пофіксити тап картинці в хедері +
// 5. Доробити DetailsListVC

class MainListVC: UIViewController {
    
    typealias CarsModelDescription = [CarModelDescription]
    private let toDetailIdentifier: String = "toDetail"
    var carsModels: CarsModelDescription?
    
    @IBOutlet weak var cnstrCarImageHeight: NSLayoutConstraint!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var collectionListView: UICollectionView!
    
    func parseCarModel() -> CarsModelDescription? {
        return LocalDataManager.extractObjectFrom(plist: "data", of: CarsModelDescription.self)
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the delegates
        collectionListView.delegate = self
        collectionListView.dataSource = self
        
        // Content configuring
        collectionListView.contentInset.top = cnstrCarImageHeight.constant
        collectionListView.scrollIndicatorInsets.top = collectionListView.contentInset.top
        
        // Setting up cars model
        carsModels = parseCarModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = collectionListView.indexPathsForSelectedItems

//        if segue.identifier == toDetailIdentifier {
//            if let detailVC = segue.destination as? DetailListVC {
//                
//            }
//        }
    }
}

// MARK: - Gesture Recognizer Section
extension MainListVC: UIGestureRecognizerDelegate {
    
    @objc func didTap(_ recognizer: UITapGestureRecognizer) {
        
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
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: toDetailIdentifier) as? DetailListVC {
            if let model = carsModels?[indexPath.item] {

                detailVC.companyTextField.text = model.company
                detailVC.modelTextField.text = model.model
                detailVC.colorTextField.text = model.color
                detailVC.yearTextField.text = model.year
                detailVC.detailICarImg.image = UIImage.init(imageLiteralResourceName: model.id)

                self.navigationController?.pushViewController(detailVC, animated: true)
            }
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
        
        // Gesture
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
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
    }
}

