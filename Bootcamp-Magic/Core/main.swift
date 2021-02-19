//
//  main.swift
//  Bootcamp-Magic
//
//  Created by lucas.henrique.costa on 19/02/21.
//

import UIKit

let kIsRunningTests = NSClassFromString("XCTestCase") != nil
let kAppDelegateClass = kIsRunningTests ?
    NSStringFromClass(AppDelegateFake.self) : NSStringFromClass(AppDelegate.self)

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, kAppDelegateClass)
