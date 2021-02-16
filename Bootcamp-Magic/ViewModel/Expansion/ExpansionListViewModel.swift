//
//  ExpansionListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

class ExpansionListViewModel {
    
    private let networkManager: NetworkManager
    private(set) var dictExpansions: [String: [ExpansionViewModel]] = [:]
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    /// Fetch expansions from API.
    /// - Parameter completion: error or not when fetch.
    func fetchExpansions(completion: @escaping (Error?) -> Void) {
        networkManager.getRequest(cardsService: .setList, decodableType: ExpansionList.self) { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.createDictExpansions(from: list)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}

//MARK:- Private methods
extension ExpansionListViewModel {
    
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
