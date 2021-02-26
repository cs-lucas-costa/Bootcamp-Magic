//
//  CardViewModel+Fixture.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import Foundation

@testable import Bootcamp_Magic

extension CardViewModel {
    
    static func fixture(type: String = "Enchantment",
                        name: String = "Abomination of Gudul",
                        networkManager: NetworkManager,
                        databaseManager: DatabaseProtocol) -> CardViewModel {
    
        return CardViewModel(card: .fixture(name: name, type: type),
                      networkManager: networkManager,
                      dataBaseManager: databaseManager)
    }
    
}
