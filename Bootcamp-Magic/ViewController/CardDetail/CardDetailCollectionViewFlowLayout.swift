//
//  CardDetailCollectionViewFlowLayout.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        
        setUpCollectionView()
        setCellSize()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCellSize() {
        
        let width = (UIScreen.main.bounds.width * 0.7)
        let height = (width * 1.4)
        
        self.itemSize = .init(width: width, height: height)
    }

    private func setUpCollectionView() {
        scrollDirection = .horizontal
        collectionView?.contentInset = .init(top: 0, left: 200, bottom: 0, right: 20)
    }
}
