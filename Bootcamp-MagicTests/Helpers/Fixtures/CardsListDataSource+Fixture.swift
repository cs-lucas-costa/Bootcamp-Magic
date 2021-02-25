//
//  CardsListDataSource+Fixture.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import Foundation

@testable import Bootcamp_Magic

extension CardsListDataSource {
    
    static func fixture(networkManager: NetworkManager, databaseManager: DatabaseProtocol) -> CardsListDataSource {
        
        let type1 = "Enchantment"
        let type2 = "Creature — Horror"
        
        let viewModel1 = CardViewModel(card: .fixture(name: "Abundance",
                                                      type: type1), networkManager: networkManager,
                                       dataBaseManager: databaseManager)
        let viewModel2 = CardViewModel(card: .fixture(name: "Abomination of Gudul",
                                                      type: type2), networkManager: networkManager,
                                       dataBaseManager: databaseManager)
        let dictCards = [Dict(key: type1, value: [viewModel1]),
                         Dict(key: type2, value: [viewModel2])]
        
        return CardsListDataSource(dictCards: dictCards)
    }
}
