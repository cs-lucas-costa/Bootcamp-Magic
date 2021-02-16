//
//  Dict.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import Foundation

//Dict to ensure order inside an array
class Dict<Key: Equatable, Value> {
    let key: Key
    var value: Value
    
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}
