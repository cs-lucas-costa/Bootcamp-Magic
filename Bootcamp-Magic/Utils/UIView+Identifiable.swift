//
//  UIView+Identifiable.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 17/02/21.
//

import UIKit

protocol Identifiable: UIView {
    static var identifier: String { get }
}

extension UIView: Identifiable {
    static var identifier: String {
        String(describing: self)
    }
}
