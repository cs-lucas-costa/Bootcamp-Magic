//
//  CardListViewModelLocal.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 24/02/21.
//

import Foundation

final class CardListViewModelLocal: CardListViewModel {
    
    // MARK: - Properties
    let networkManager: NetworkManager
    let dataBaseManager: DatabaseProtocol
    var dictCards: [Dict<String, [CardViewModel]>] = []
    
    // MARK: - Init
    init(networkManager: NetworkManager, dataBaseManager: DatabaseProtocol) {
        self.networkManager = networkManager
        self.dataBaseManager = dataBaseManager
    }
    
    // MARK: - Methods
    func fetchCards(setCode: String, completion: @escaping (Error?) -> Void) {
        
        dataBaseManager.fetch(type: Card.self, with: nil, and: []) { [weak self] result in
            switch result {
            case .success(let response):
                let cardList = CardList(cards: response)
                self?.separateCardsWithType(list: cardList)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
}
