//
//  Fonts.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 18/02/21.
//

import UIKit

enum Fonts {
    
    case robotoBold(size: CGFloat)
    
    var font: UIFont {
        
        var font: UIFont?
        
        switch self {
        case .robotoBold(let size):
            font = UIFont(name: "Roboto-Bold", size: size)
        }
        
        return font ?? .systemFont(ofSize: 16)
    }
}
