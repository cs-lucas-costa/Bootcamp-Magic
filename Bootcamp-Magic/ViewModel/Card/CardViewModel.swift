//
//  CardViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import UIKit

final class CardViewModel {

    private let card: Card
    
    init(card: Card) {
        self.card = card
    }

    var name: String {
        card.name
    }

    var type: String {
        card.type
    }
    
    var imageUrl: String? {
        card.imageUrl
    }

}
