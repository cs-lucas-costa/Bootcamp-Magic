//
//  Expansion.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

struct Expansion: Decodable {
    let code: String
    let name: String
}

struct ExpansionList: Decodable {
    
    let expansions: [Expansion]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        expansions = try container.decode([Expansion].self, forKey: .sets)
    }
}

extension ExpansionList {
    enum CodingKeys: String, CodingKey {
        case sets
    }
}

extension Expansion: Equatable {
    static func == (lhs: Expansion, rhs: Expansion) -> Bool {
        return lhs.name == rhs.name
            && lhs.code == rhs.code
    }
}

extension ExpansionList: Equatable {
    static func == (lhs: ExpansionList, rhs: ExpansionList) -> Bool {
        return lhs.expansions == rhs.expansions
    }
}
