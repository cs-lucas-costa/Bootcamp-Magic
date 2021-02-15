//
//  ExpansionListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

class ExpansionListViewModel {
    
    private let list: ExpansionList
    
    init(list: ExpansionList) {
        self.list = list
    }
    
    var expansions: [ExpansionViewModel] {
        list.expansions.map { ExpansionViewModel(expansion: $0) }
    }
    
}
