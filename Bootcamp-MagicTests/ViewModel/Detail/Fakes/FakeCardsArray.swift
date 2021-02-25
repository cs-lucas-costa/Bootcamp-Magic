//
//  FakeCardsArray.swift
//  Bootcamp-MagicTests
//
//  Created by pedro.silveira on 18/02/21.
//

import Foundation
@testable import Bootcamp_Magic

final class FakeCardsArray {
    
    var networkManager: NetworkManager!
    var serviceStub: NetworkServiceStub!
    var databaseManager: DatabaseProtocol!

    init() {
        let bundle = Bundle(for: type(of: self))
        self.serviceStub = NetworkServiceStub(bundle: bundle)
        serviceStub.json = bundle.url(forResource: "cards", withExtension: "json")
        self.networkManager = NetworkManager(service: serviceStub)
        self.databaseManager = CoreDataDB(container: CoreDataContainerFake())
    }
    
    func getCards() -> [CardViewModel] {
        
        var cards: [CardViewModel] = []
        
        networkManager.getRequest(cardsService: CardsService.cardsList(setCode: ""), decodableType: CardList.self) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let cardList):
                cards = cardList.cards.map { CardViewModel(card: $0, networkManager: self.networkManager,
                                                           dataBaseManager: self.databaseManager) }
            case .failure:
                cards = []
            }
        }
        
        return cards
    }
}
