//
//  HomeViewController.swift
//  RxMVVM
//
//  Created by Bertrand BLOC'H on 18/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Main
    private let mainContainer = UIStackView(
        alignment: .center,
        axis: .vertical,
        spacing: 8
    )
    private let titleLabel = UILabel()
    private let pressMeButton = UIButton()

    // MARK: - Properties

    private let disposeBag = DisposeBag()
    private let viewModel: HomeViewModel

    // MARK: - Init

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupView()
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

    private func setupView() {
        view.addSubview(mainContainer)
        mainContainer.snp.makeConstraints {
            $0.leading.equalTo(view).inset(8)
            $0.trailing.equalTo(view).inset(8)
            $0.centerY.equalTo(view)
        }
        mainContainer.addArrangedSubviews([
            titleLabel,
            pressMeButton
        ])

        setUI()
    }

    private func setUI() {
        view.backgroundColor = .white
        titleLabel.textColor = .black
        pressMeButton.setTitleColor(.blue, for: .normal)
        pressMeButton.setTitleColor(.lightGray, for: .highlighted)
    }
}
