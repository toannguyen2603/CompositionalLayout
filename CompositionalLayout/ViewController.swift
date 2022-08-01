//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Nguyễn Hữu Toàn on 01/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        
        let compositionalLayout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            return createBasicListLayout(section: sectionNumber)
        }
        compositionalLayout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")

        let collection = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collection.register( HeaderSupplementaryView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: HeaderSupplementaryView.identifier)

        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
     static func createBasicListLayout(section: Int) -> NSCollectionLayoutSection { 
         
        switch section {
                
            case 0:
                
                return createNestedGround(widthItem: .fractionalWidth(1.0), heightItem: .fractionalHeight(1.0), top: 5, leading: 5, bottom: 5, trailing: 5, widthVertical: .fractionalWidth(1.0), heightVertical: .fractionalHeight(1.0), widthHorizotal: .absolute(220), heightHorizotal: .absolute(300), countVertical: 3, countHorizotal: 1)!
                
                
            case 1:
                
                return createBasicCompositionLayout(widthItem: .absolute(200), heightItem: .absolute(200), top: 5, leading: 5, bottom: 5, trailing: 5, widthHorizotal: .absolute(100), heightHorizotal: .absolute(200))!
                
            case 2: 
                
                return createBasicCompositionLayout(widthItem: .fractionalWidth(1.0), heightItem: .absolute(100), top: 5, leading: 5, bottom: 5, trailing: 5, widthHorizotal: .absolute(100), heightHorizotal: .absolute(100))!
                
            case 3: 
                
                return createBasicCompositionLayout(widthItem: .fractionalWidth(1.0), heightItem: .fractionalWidth(1.0), top: 5, leading: 5, bottom: 5, trailing: 5, widthHorizotal: .absolute(200), heightHorizotal: .absolute(200))!
            case 4: 
                return createBasicCompositionLayout(widthItem: .fractionalWidth(1.0), heightItem: .absolute(100), top: 5, leading: 5, bottom: 5, trailing: 5, widthVertical: .fractionalWidth(1.0), heightVertical: .absolute(100))!
                
            default:
                
                    // item
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(200))  
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)  
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                    // group 
                let groupVeriticalSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .fractionalHeight(1.0)) 
                
                let groupVertical = NSCollectionLayoutGroup.vertical(layoutSize: groupVeriticalSize, subitem: item, count: 3)
                
                let groupHorizotalSize = NSCollectionLayoutSize(widthDimension: .absolute(210), heightDimension: .absolute(630)) 
                
                let groupHorizontal = NSCollectionLayoutGroup.horizontal(layoutSize: groupHorizotalSize, subitem: groupVertical, count: 1)
                
                    // section
                let section = NSCollectionLayoutSection(group: groupHorizontal)    
                
                section.orthogonalScrollingBehavior = .groupPaging
                
                return section
                
        }
    }
    
    
    
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSupplementaryView.identifier, for: indexPath) as? HeaderSupplementaryView else {
            return HeaderSupplementaryView()
        }
        headerView.getData(ViewModel(title: "Section \(indexPath.section + 1)"))
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
            case 0:
                cell.backgroundColor = .systemMint
            case 1: 
                cell.backgroundColor = .systemRed
            case 2: 
                cell.backgroundColor = .systemFill
            case 3:
                cell.backgroundColor = .systemBlue
            case 4:
                cell.backgroundColor = .systemPink
            default: 
                cell.backgroundColor = .systemFill
        }
        return cell 
    }

}

