//
//  HomeViewController.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 18/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var pressMeButton: UIButton!

    // MARK: - Properties

    private var disposeBag = DisposeBag()
    private var viewModel = HomeViewModel()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }

    private func setupView() {
        
    }

    private func bindViewModel() {
        let startTrigger = rx
            .viewIsLoaded

        let didPressButton = pressMeButton.rx
            .tap
            .asObservable()

        let inputs = HomeViewModel.Inputs(
            startTrigger: startTrigger,
            didPressButton: didPressButton
        )

        let outputs = viewModel.transform(inputs: inputs)

        outputs
            .title
            .asDriver(onErrorJustReturn: "Error")
            .drive(onNext: { [weak self] text in
                self?.titleLabel.text = text
            })
            .disposed(by: disposeBag)

        outputs
            .buttonTitle
            .asDriver(onErrorJustReturn: "Error")
            .drive(onNext: { [weak self] text in
                self?.pressMeButton.setTitle(text, for: .normal)
            })
            .disposed(by: disposeBag)
    }
}

public extension Reactive where Base: UIViewController {
    var viewIsLoaded: Observable<Void> {
        base.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).map { _ in }.take(1)
    }
}
