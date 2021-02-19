//
//  CardsListDelegateSpy.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

@testable import Bootcamp_Magic

class CardsListDelegateSpy: CardsListDelegate {
        
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCard?([CardViewModel(card: .fixture())])
    }
    
}
