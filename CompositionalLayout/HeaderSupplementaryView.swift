//
//  HeaderSupplementaryView.swift
//  CompositionalLayout
//
//  Created by Nguyễn Hữu Toàn on 02/08/2022.
//

import UIKit

struct ViewModel {
    let title: String
}

class HeaderSupplementaryView: UICollectionReusableView {
    
    lazy var titleSection: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    static let identifier = "HeaderSupplementaryView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(titleSection)
        
//        titleSection.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        NSLayoutConstraint.activate([
//            titleSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            titleSection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            titleSection.topAnchor.constraint(equalTo: self.topAnchor),
//            titleSection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])

        titleSection.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    func getData(_ model: ViewModel) {
        titleSection.text = model.title
    }
    
    
}
