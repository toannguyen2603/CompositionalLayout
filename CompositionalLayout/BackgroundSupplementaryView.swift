//
//  BackgroundSupplementaryView.swift
//  CompositionalLayout
//
//  Created by Nguyễn Hữu Toàn on 02/08/2022.
//

import UIKit

final class BackgroundSupplementaryView: UICollectionReusableView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = UIColor(white: 0.85, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
