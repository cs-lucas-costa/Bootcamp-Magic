//
//  CardDetailCollectionViewDataSource.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private var cardsPaths: [CardViewModel]

    init(cardsPaths: [CardViewModel]) {
        self.cardsPaths = cardsPaths
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsPaths.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentImage = cardsPaths[indexPath.row % cardsPaths.count]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let image = currentImage.cardImage {
            cell.imageView.image = image
        }
        
        cell.setupView()

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

}
