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

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainStore.subscribe(self){ (subscription) in
            subscription.select { state in state.counterState }.skipRepeats()
        }
    }
    
    @IBAction func didTapPlusButton(_ sender: Any) {
        mainStore.dispatch(CounterAction.up)
    }

    @IBAction func didTapMinusButton(_ sender: Any) {
        mainStore.dispatch(CounterAction.down)
    }

    @IBAction func didTapSetValueButton(_ sender: Any) {
        guard let text = valueTextField.text, let v = Int(text) else { return }
        mainStore.dispatch(CounterAction.setValue(value: v))
    }
}

extension ViewController: StoreSubscriber {
    typealias TargetState = CounterState
    typealias StoreSubscriberStateType = CounterState

    func newState(state: CounterState) {
        update(with: state)
    }

    func update(with state: CounterState?) {
        print("customAction called")
        guard let state = state else {
            valueLabel.text = ""
            return
        }
        valueLabel.text = "\(state.count)"
    }
}
