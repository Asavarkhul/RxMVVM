//
//  HomeViewModel.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 18/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewModel {

    // MARK: - Inputs

    struct Inputs {
        let startTrigger: Observable<Void>
        let didPressButton: Observable<Void>
    }

    // MARK: - Outputs

    struct Outputs {
        let title: Observable<String>
        let buttonTitle: Observable<String>
    }

    // MARK: - Transform

    func transform(inputs: Inputs) -> Outputs {
        
        
        
        
        return .init(
            title: .just("Toto"),
            buttonTitle: .never()
        )
    }
}
