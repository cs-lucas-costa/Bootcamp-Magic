//
//  DatabaseProtocol.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 24/02/21.
//

import Foundation

protocol DatabaseProtocol {
    
    func create<Element: Storageable>(element: Element,
                                      completion: @escaping (Result<Element, Error>) -> Void)
    
    func delete<Element: Storageable>(element: Element, completion: @escaping (Error?) -> Void)
    
    func fetch<Element: Storageable>(type: Element.Type,
                                     with predicate: NSPredicate?,
                                     and sortDescriptors: [NSSortDescriptor],
                                     completion: @escaping ((Result<[Element], Error>) -> Void))
}
