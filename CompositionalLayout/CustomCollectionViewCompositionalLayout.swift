//
//  CustomCollectionViewLayout.swift
//  CompositionalLayout
//
//  Created by Nguyễn Hữu Toàn on 01/08/2022.
//

import Foundation
import UIKit

extension ViewController {
        
    static func createBasicCompositionLayout( widthItem: NSCollectionLayoutDimension,
                                              heightItem: NSCollectionLayoutDimension,
                                              top: CGFloat = 0,
                                              leading: CGFloat = 0,
                                              bottom: CGFloat = 0,
                                              trailing: CGFloat = 0,
                                              widthVertical: NSCollectionLayoutDimension? = nil,
                                              heightVertical: NSCollectionLayoutDimension? = nil,
                                              widthHorizotal: NSCollectionLayoutDimension? = nil,
                                              heightHorizotal: NSCollectionLayoutDimension? = nil,
                                              countVertical: Int = 1,
                                              countHorizotal: Int = 1 
                                            ) -> NSCollectionLayoutSection? 
    {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: widthItem, heightDimension: heightItem)  
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize) 
        
        item.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        
        if let widthHorizotal = widthHorizotal, let  heightHorizotal = heightHorizotal {
            
            let groupHorizotalSize = NSCollectionLayoutSize(widthDimension: widthHorizotal, heightDimension: heightHorizotal) 
            
            let groupHorizontal = NSCollectionLayoutGroup.horizontal(layoutSize: groupHorizotalSize, subitem: item, count: countHorizotal)
            
            let section = NSCollectionLayoutSection(group: groupHorizontal)  
            
            section.orthogonalScrollingBehavior = .continuous
            
//            // Bonus Round
//            section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//                items.forEach { item in
//                    let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                    let minScale: CGFloat = 0.7
//                    let maxScale: CGFloat = 1.1
//                    let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                    item.transform = CGAffineTransform(scaleX: scale, y: scale)
//                }
//            }
            
            //MARK: - Supplementary Item
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
            section.boundarySupplementaryItems = [headerItem]
            
//            // Decoration Items
//            let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
//            let backgroundInset: CGFloat = 8
//            backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: backgroundInset, leading: backgroundInset, bottom: backgroundInset, trailing: backgroundInset)
//            section.decorationItems = [backgroundItem]
//            
            return section
        }
        
        if let widthVertical = widthVertical , let heightVertical = heightVertical {
            
            let groupVerticalSize = NSCollectionLayoutSize(widthDimension: widthVertical, heightDimension: heightVertical) 
            
            let groupVertical = NSCollectionLayoutGroup.horizontal(layoutSize: groupVerticalSize, subitem: item, count: countHorizotal)
            
            let section = NSCollectionLayoutSection(group: groupVertical)  
            
            // Supplementary Item
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
            section.boundarySupplementaryItems = [headerItem]
            
            return section
        }
        
        return nil
        
    }
    
    static func createNestedGround( widthItem: NSCollectionLayoutDimension,
                                    heightItem: NSCollectionLayoutDimension,
                                    top: CGFloat = 0, leading: CGFloat = 0,
                                    bottom: CGFloat = 0, trailing: CGFloat = 0,
                                    widthVertical: NSCollectionLayoutDimension? = nil,
                                    heightVertical: NSCollectionLayoutDimension? = nil,
                                    widthHorizotal: NSCollectionLayoutDimension? = nil,
                                    heightHorizotal: NSCollectionLayoutDimension? = nil,
                                    countVertical: Int = 1,
                                    countHorizotal: Int = 1 
                                  ) -> NSCollectionLayoutSection? {
        
        guard let widthVertical = widthVertical,
              let heightVertical = heightVertical,
              let widthHorizotal = widthHorizotal,
              let heightHorizotal = heightHorizotal
        else { return nil}
    
        let itemSize = NSCollectionLayoutSize(widthDimension: widthItem, heightDimension: heightItem)  
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)  
        
        item.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)

        let groupVeriticalSize = NSCollectionLayoutSize(widthDimension: widthVertical, heightDimension: heightVertical) 
        
        let groupVertical = NSCollectionLayoutGroup.vertical(layoutSize: groupVeriticalSize, subitem: item, count: countVertical)
        
        let groupHorizotalSize = NSCollectionLayoutSize(widthDimension: widthHorizotal, heightDimension: heightHorizotal) 
        
        let groupHorizontal = NSCollectionLayoutGroup.horizontal(layoutSize: groupHorizotalSize, subitem: groupVertical, count: countHorizotal)
        
        let section = NSCollectionLayoutSection(group: groupHorizontal)
        
        section.orthogonalScrollingBehavior = .continuous
        
        // Supplementary Item
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
        
        return section
        
    }
    
}
