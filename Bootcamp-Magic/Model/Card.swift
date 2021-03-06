//
//  Card.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

// MARK: Card
struct Card: Decodable {
    let name: String
    let imageUrl: String?
    let type: String
    let id: String
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
            && lhs.imageUrl == rhs.imageUrl
            && lhs.type == rhs.type
            && lhs.id == rhs.id
    }
}

// MARK: CardList
struct CardList: Decodable {
    let cards: [Card]
}

extension CardList: Equatable {
    static func == (lhs: CardList, rhs: CardList) -> Bool {
        return lhs.cards == rhs.cards
    }
}
