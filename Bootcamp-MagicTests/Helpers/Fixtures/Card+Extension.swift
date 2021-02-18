//
//  Card+Extension.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import Foundation

@testable import Bootcamp_Magic

extension Card {
    
    static func fixture(name: String = "Abundance",
                        type: String = "Enchantment",
                        id: String = UUID().uuidString,
                        imageUrl: String = "") -> Self {
        .init(name: name, imageUrl: imageUrl, type: type, id: id)
    }
    
}
