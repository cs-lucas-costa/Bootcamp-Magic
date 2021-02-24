//
//  CardListViewModelLocal.swift
//  Bootcamp-Magic
//
//  Created by luis.gustavo.jacinto on 24/02/21.
//

import Foundation

final class CardListViewModelLocal: CardListViewModel {
  
  // MARK: - Properties
  private let networkManager: NetworkManager
  var dictCards: [Dict<String, [CardViewModel]>] = []
  
  // MARK: - Init
  init(networkManager: NetworkManager) {
    self.networkManager = networkManager
  }
  
  // MARK: - Methods
  func fetchCards(setCode: String, completion: @escaping (Error?) -> Void) {
    #warning("Fetch card from local database and set dictCards")
    let cardList = CardList(cards: [Card(name: "Archangel Avacyn", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card", type: "Legendary Creature — Angel", id: "02ea5ddc89d7847abc77a0fbcbf2bc74e6456559"), Card(name: "Archangel Avacyn", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card", type: "Legendary Creature — Angel", id: "02ea5ddc89d7847abc77a0fbcbf2bc74e6456559"), Card(name: "Archangel Avacyn", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card", type: "Legendary Creature — Angel", id: "02ea5ddc89d7847abc77a0fbcbf2bc74e6456559"), Card(name: "Narset, Enlightened Master", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card", type: "Legendary Creature — Human Monk", id: "02ea5ddc89d7847abc77a0fbcbf2bc74e6456558"), Card(name: "Narset, Enlightened Master", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card", type: "Legendary Creature — Human Monk", id: "02ea5ddc89d7847abc77a0fbcbf2bc74e6456558")])
    separateCardsWithType(list: cardList)
    completion(nil)
  }
  
  func separateCardsWithType(list: CardList) {
      list.cards
          .sorted(by: { $0.type < $1.type })
          .forEach { [weak self] (card) in

              guard let self = self, card.imageUrl != nil else { return }
              let key = card.type
              let viewModel = CardViewModel(card: card, networkManager: networkManager)
              
              if let dict = self.dictCards.first(where: { $0.key == key }) {
                  dict.value.append(viewModel)
              } else {
                  self.dictCards.append(Dict(key: key, value: [viewModel]))
              }
          }

  }
}
