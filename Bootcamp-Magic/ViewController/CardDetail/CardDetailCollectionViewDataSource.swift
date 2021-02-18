//
//  CardDetailCollectionViewDataSource.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
import UIKit

final class CardDetailCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private var cards: [UIImage]

    init(cards: [UIImage]) {
        self.cards = cards
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.max
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let currentImage = cards[indexPath.row % cards.count]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardDetailCollectionViewCell.cellID(), for: indexPath) as? CardDetailCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setUpCardImage(with: currentImage)

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

}
