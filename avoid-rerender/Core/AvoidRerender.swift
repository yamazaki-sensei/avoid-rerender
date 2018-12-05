//
// Created by Hiraku Ohno on 2018-12-06.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import UIKit

protocol AvoidRerender: class {
    associatedtype T: Equatable

    var state: T { get set }

    func updateState(next: T)
    func customAction()
}

extension AvoidRerender where Self: UIViewController {
    func updateState(newState: T) {
        guard newState != self.state else { return }

        self.state = newState

        customAction()

        self.view.setNeedsLayout()
    }
}

extension AvoidRerender where Self: UIView {
    func updateState(newState: T) {
        guard newState != self.state else { return }

        self.state = newState

        customAction()

        setNeedsLayout()
    }
}
