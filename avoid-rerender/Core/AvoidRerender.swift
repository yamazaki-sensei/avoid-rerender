//
// Created by Hiraku Ohno on 2018-12-06.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import UIKit

protocol AvoidRerender: class {
    associatedtype TargetState: Equatable

    var state: TargetState? { get set }

    func update(with state: TargetState?)
    func customAction(state: TargetState?)
}

extension AvoidRerender where Self: UIViewController {
    func update(with state: TargetState?) {
        guard state != self.state else { return }

        self.state = state

        customAction(state: state)

        self.view.setNeedsLayout()
    }
}

extension AvoidRerender where Self: UIView {
    func update(with state: TargetState?) {
        guard state != self.state else { return }

        self.state = state

        customAction(state: state)

        setNeedsLayout()
    }
}
