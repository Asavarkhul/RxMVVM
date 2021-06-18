//
//  HomeViewModelTests.swift
//  RxMVVMTests
//
//  Created by Bertrand BLOC'H on 18/06/2021.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RxMVVM

final class OrderDetailsViewModelTests: XCTestCase {

    private var disposeBag: DisposeBag!
    private var startTrigger: PublishSubject<Void>!
    private var didPressButton: PublishSubject<Void>!

    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        startTrigger = PublishSubject<Void>()
        didPressButton = PublishSubject<Void>()
    }

    func test() {
        let expectation = self.expectation(description: "Returned Title")
        let viewModel = HomeViewModel()
        let inputs = makeMockInputs()
        let outputs = viewModel.transform(inputs: inputs)

        outputs
            .title
            .asDriver(onErrorJustReturn: "Error")
            .drive(onNext: { text in
                XCTAssertEqual(text, "Toto")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        startTrigger.onNext(())

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    private func makeMockInputs() -> HomeViewModel.Inputs {
        return HomeViewModel.Inputs(
            startTrigger: startTrigger,
            didPressButton: didPressButton
        )
    }
}
