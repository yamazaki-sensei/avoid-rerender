//
//  ViewController.swift
//  avoid-rerender
//
//  Created by Hiraku Ohno on 2018/12/06.
//  Copyright © 2018 yamazakisensei. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    var state: TargetState?

    override func viewDidLoad() {
        super.viewDidLoad()

        mainStore.subscribe(self){ (subscription) in
            subscription.select { state in state.counterState }
        }
    }
}

extension ViewController: StoreSubscriber, AvoidRerender {
    typealias TargetState = CounterState
    typealias StoreSubscriberStateType = CounterState

    func newState(state: CounterState) {
        update(with: state)
    }

    func customAction(state: CounterState?) {

    }
}
