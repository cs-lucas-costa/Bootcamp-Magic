//
//  CardDetailDataSource+Fixtures.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 23/02/21.
//

import Foundation

@testable import Bootcamp_Magic

extension CardDetailCollectionViewDataSource {
    
    static func fixture(networkManager: NetworkManager, databaseManager: DatabaseProtocol) -> CardDetailCollectionViewDataSource {
                
        let viewModel1 = CardViewModel.fixture(networkManager: networkManager, databaseManager: databaseManager)
        let viewModel2 = CardViewModel.fixture(networkManager: networkManager, databaseManager: databaseManager)
        let cards = [viewModel1, viewModel2]
        
        return CardDetailCollectionViewDataSource(cardsPaths: cards)
    }
}
