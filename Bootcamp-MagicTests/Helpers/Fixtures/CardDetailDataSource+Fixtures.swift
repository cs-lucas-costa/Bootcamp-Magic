//
//  CardDetailDataSource+Fixtures.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 23/02/21.
//

import Foundation

@testable import Bootcamp_Magic

extension CardDetailCollectionViewDataSource {
    
    static func fixture(networkManager: NetworkManager) -> CardDetailCollectionViewDataSource {
        
        let type1 = "Enchantment"
        let type2 = "Creature — Horror"
        
        let viewModel1 = CardViewModel(card: .fixture(name: "Abundance",
                                                      type: type1), networkManager: networkManager)
        let viewModel2 = CardViewModel(card: .fixture(name: "Abomination of Gudul",
                                                      type: type2), networkManager: networkManager)
        let cards = [viewModel1, viewModel2]
        
        return CardDetailCollectionViewDataSource(cardsPaths: cards)
    }
}
