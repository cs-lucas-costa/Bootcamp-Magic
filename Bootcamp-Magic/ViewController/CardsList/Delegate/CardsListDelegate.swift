//
//  CardsListDelegate.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

class CardsListDelegate: NSObject, UICollectionViewDelegate {
            
    var didSelectCard: ((IndexPath) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCard?(indexPath)
    }

}
