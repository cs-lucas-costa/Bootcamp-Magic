//
//  Card.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

struct Card: Decodable {
    let name: String
    let imageUrl: String
    let type: String
    let id: String
}

struct CardList: Decodable {
    let cards: [Card]
}

