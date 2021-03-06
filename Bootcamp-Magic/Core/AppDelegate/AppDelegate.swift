//
//  AppDelegate.swift
//  Bootcamp-Magic
//
//  Created by pedro.silveira on 15/02/21.
//

import UIKit
import CoreData

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      // Setup Coordinator
      coordinator = MainCoordinator()
      coordinator?.start()

      // Setup Window
      self.window = UIWindow(frame: UIScreen.main.bounds)
      self.window?.makeKeyAndVisible()
      self.window?.rootViewController = coordinator?.currentViewController

      return true
    }

}
