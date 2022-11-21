//
//  AppDelegate.swift
//  StockApp-IOS
//
//  Created by Zhandos Baimurat on 20.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StockAssembly.assembler.stockVC()
        window?.makeKeyAndVisible()
        return true
    }
}

