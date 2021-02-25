//
//  CardsListSearchView+UITextDelegate.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import UIKit

extension CardsListSearchView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
