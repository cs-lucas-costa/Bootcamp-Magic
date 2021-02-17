//
//  ExpansionListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 15/02/21.
//

import Foundation

final class ExpansionListViewModel {
    
    private let networkManager: NetworkManager
    private(set) var dictExpansions: [Dict<String, [ExpansionViewModel]>] = []
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    /// Fetch expansions from API.
    /// - Parameter completion: error or nil when fetch.
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
private extension ExpansionListViewModel {
    
    func createDictExpansions(from list: ExpansionList) {
        list.expansions
            .sorted(by: { $0.name < $1.name })
            .forEach { [weak self] (expansion) in
                
                guard let self = self else { return }
                guard let key = expansion.name.first?.uppercased() else { return }
                let viewModel = ExpansionViewModel(expansion: expansion)
                
                if let dict = self.dictExpansions.first(where: { $0.key == key }) {
                    dict.value.append(viewModel)
                } else {
                    self.dictExpansions.append(Dict(key: key, value: [viewModel]))
                }
            }
    }
}
