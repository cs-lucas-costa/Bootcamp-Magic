//
//  AppDelegate.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      print(#function)
      // Setup Coordinator
//      let navigationController = UINavigationController()
      coordinator = MainCoordinator() //MainCoordinator(navigationController: navigationController)
      coordinator?.start()
      
      // Setup Window
      self.window = UIWindow(frame: UIScreen.main.bounds)
      self.window?.makeKeyAndVisible()
      self.window?.rootViewController = coordinator!.navigationMenuTabBarController
      
        return true
    }

}

