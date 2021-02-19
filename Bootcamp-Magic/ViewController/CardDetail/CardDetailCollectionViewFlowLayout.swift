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
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpCollectionView() {
        scrollDirection = .horizontal
        collectionView?.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
}
