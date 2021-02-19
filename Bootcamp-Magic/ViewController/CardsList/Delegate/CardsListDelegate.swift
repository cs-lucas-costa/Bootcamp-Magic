//
//  CardsListDelegate.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

class CardsListDelegate: NSObject, UICollectionViewDelegate {
            
    private let dictCards: [Dict<String, [CardViewModel]>]
    var didSelectCard: (([CardViewModel]) -> Void)?
    
    init(dictCards: [Dict<String, [CardViewModel]>]) {
        self.dictCards = dictCards
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = dictCards[indexPath.section].value
        didSelectCard?(card)
    }

}
