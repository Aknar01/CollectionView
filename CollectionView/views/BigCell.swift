//
//  BigCell.swift
//  CollectionView
//
//  Created by Aknar Assanov on 01.02.2023.
//

import UIKit

class BigCell: UICollectionViewCell {
    
    static let bigCellIdentifier = "BigCellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
