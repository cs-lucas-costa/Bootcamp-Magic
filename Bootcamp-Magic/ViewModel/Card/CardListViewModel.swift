//
//  CardListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import Foundation

final class CardListViewModel {
    
    private let networkManager: NetworkManager
    private(set) var dictCards: [String: [CardViewModel]] = [:]
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchCards(setCode: String, completion: @escaping (Error?) -> Void) {
        networkManager.getRequest(cardsService: .cardsList(setCode: setCode), decodableType: CardList.self) { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.separateCardsWithType(list: list)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
}

//MARK: Private methods
private extension CardListViewModel {
    
    func separateCardsWithType(list: CardList) {
        list.cards
            .sorted(by: { $0.type < $1.type })
            .forEach { [weak self] (card) in
                
                guard let self = self else { return }
                let key = card.type
                
                if !self.dictCards.keys.contains(key) {
                    self.dictCards[key] = []
                }
                
                self.dictCards[key]?.append(CardViewModel(card: card))
            }
    }
    
}
