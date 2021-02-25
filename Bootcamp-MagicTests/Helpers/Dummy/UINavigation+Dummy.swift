//
//  UINavigation+Dummy.swift
//  Bootcamp-MagicTests
//
//  Created by lucas.henrique.costa on 25/02/21.
//

import UIKit

extension UINavigationController {
    static var dummy: UINavigationController {
        let window = UIApplication.shared.windows.first
        let navigation = UINavigationController()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return navigation
    }
}
