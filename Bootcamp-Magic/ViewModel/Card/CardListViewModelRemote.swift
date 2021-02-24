//
//  CardListViewModelRemote.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 24/02/21.
//

import Foundation

final class CardListViewModelRemote: CardListViewModel {
    
    // MARK: - Properties
    let networkManager: NetworkManager
    var dataBaseManager: DatabaseProtocol
    var dictCards: [Dict<String, [CardViewModel]>] = []
    
    // MARK: - Init
    init(networkManager: NetworkManager, dataBaseManager: DatabaseProtocol) {
        self.networkManager = networkManager
        self.dataBaseManager = dataBaseManager
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
