//
//  AppDelegateFake.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 19/02/21.
//

import UIKit

class AppDelegateFake: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
