//
//  SmallCell.swift
//  CollectionView
//
//  Created by Aknar Assanov on 01.02.2023.
//

import UIKit

class SmallCell: UICollectionViewCell {
    
    static let smallCellIdentifier = "SmallCellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
