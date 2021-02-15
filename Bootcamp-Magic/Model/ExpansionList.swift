//
//  ExpansionList.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

struct ExpansionList: Decodable {
    
    private(set) var expansions: [Expansion]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        expansions = try container.decode([Expansion].self, forKey: .sets)
            .sorted(by: { $0.name < $1.name })
    }
}

extension ExpansionList {
    enum CodingKeys: String, CodingKey {
        case sets
    }
}
