//
// Created by Hiraku Ohno on 2018-12-07.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import ReSwift

struct CounterState: StateType {
    var count = 0
}

extension CounterState: Equatable {
    static func == (lhs: CounterState, rhs: CounterState) -> Bool {
        return lhs.count == rhs.count
    }
}
