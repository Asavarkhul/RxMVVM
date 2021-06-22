//
//  UIViewController+Rx.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 22/06/2021.
//

import UIKit
import RxSwift

public extension Reactive where Base: UIViewController {
    var viewIsLoaded: Observable<Void> {
        base.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).map { _ in }.take(1)
    }
}
