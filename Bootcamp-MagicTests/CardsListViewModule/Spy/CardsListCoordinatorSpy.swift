//
//  CardsListCoordinatorSpy.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import Foundation

@testable import Bootcamp_Magic

class CardsListCoordinatorSpy: CardsListCoordinatorProtocol {
    
    var selectCard: Bool = false
    
    func showCardDetail(_ card: CardViewModel) {
        selectCard = true
    }

}
