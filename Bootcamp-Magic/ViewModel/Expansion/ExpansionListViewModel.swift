//
//  ExpansionListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

class ExpansionListViewModel {
    
    private(set) var dictExpansions: [String: [ExpansionViewModel]] = [:]
    
    init(list: ExpansionList) {
        createDictExpansions(from: list)
    }
    
    //MARK: Methods
    private func createDictExpansions(from list: ExpansionList) {
        list.expansions
            .sorted(by: { $0.name < $1.name })
            .forEach { [weak self] (expansion) in
                
                guard let self = self else { return }
                guard let key = expansion.name.first?.uppercased() else { return }
                
                if !self.dictExpansions.keys.contains(key) {
                    self.dictExpansions[key] = []
                }
                
                self.dictExpansions[key]?.append(ExpansionViewModel(expansion: expansion))
            }
    }
    
}
