//
//  CardListViewModel.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 16/02/21.
//

import Foundation

protocol CardListViewModel {
  var dictCards: [Dict<String, [CardViewModel]>] { get }
  func fetchCards(setCode: String, completion: @escaping (Error?) -> Void)
}
