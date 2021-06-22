//
//  Screens.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 22/06/2021.
//

import UIKit

struct Screens {}

// Home

extension Screens {
    static func createHome() -> UIViewController {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
