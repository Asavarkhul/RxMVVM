//
//  AppDelegate.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 18/06/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator(appDelegate: self)
        coordinator.start()
        return true
    }
}
