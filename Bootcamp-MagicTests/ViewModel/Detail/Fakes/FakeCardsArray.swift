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

    init() {
        let bundle = Bundle(for: type(of: self))
        self.serviceStub = NetworkServiceStub(bundle: bundle)
        serviceStub.json = bundle.url(forResource: "cards", withExtension: "json")
        self.networkManager = NetworkManager(service: serviceStub)
    }
    
    func getCards() -> [Card] {
        
        var cards: [Card] = []
        
        networkManager.getRequest(cardsService: CardsService.cardsList(setCode: ""), decodableType: CardList.self) { result in
            switch result {
            case .success(let cardList):
                cards = cardList.cards
            case .failure:
                cards = []
            }
        }
        
        return cards
    }
}
