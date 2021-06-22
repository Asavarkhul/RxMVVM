//
//  AppCoordinator.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 22/06/2021.
//

import UIKit

final class AppCoordinator {

    // MARK: - Private properties

    private unowned var appDelegate: AppDelegate

    // MARK: - Initializer

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    // MARK: - Coordinator

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()

        showHome()
    }

    private func showHome() {
        let home = Screens.createHome()
        appDelegate.window!.rootViewController = home
    }
}
