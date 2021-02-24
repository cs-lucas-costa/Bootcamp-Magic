//
//  CardListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import Foundation

protocol CardListViewModel: AnyObject {
    var dictCards: [Dict<String, [CardViewModel]>] { get set }
    var networkManager: NetworkManager { get }
    var dataBaseManager: DatabaseProtocol { get }
    func fetchCards(setCode: String, completion: @escaping (Error?) -> Void)
}

extension CardListViewModel {
    func separateCardsWithType(list: CardList) {
        
        dictCards = []
        
        list.cards
            .sorted(by: { $0.type < $1.type })
            .forEach { [weak self] (card) in

                guard let self = self, card.imageUrl != nil else { return }
                let key = card.type
                
                let viewModel = CardViewModel(card: card,
                                              networkManager: self.networkManager,
                                              dataBaseManager: dataBaseManager)
                
                if let dict = self.dictCards.first(where: { $0.key == key }) {
                    dict.value.append(viewModel)
                } else {
                    self.dictCards.append(Dict(key: key, value: [viewModel]))
                }
            }

    }
}
