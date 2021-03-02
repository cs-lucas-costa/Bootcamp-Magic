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
        
        let name1 = "Abundance"
        let name2 = "Abomination of Gudul"
        
        let type1 = "Enchantment"
        let type2 = "Creature — Horror"
        
        let viewModel1 = CardViewModel.fixture(type: type1,
                                               name: name1,
                                               networkManager: networkManager,
                                               databaseManager: databaseManager)
        
        let viewModel2 = CardViewModel.fixture(type: type2,
                                               name: name2,
                                               networkManager: networkManager,
                                               databaseManager: databaseManager)
        
        let dictCards = [Dict(key: type1, value: [viewModel1]),
                         Dict(key: type2, value: [viewModel2])]
        
        let datasource = CardsListDataSource()
        datasource.updateData(dictCards: dictCards)
        
        return datasource
    }
}
