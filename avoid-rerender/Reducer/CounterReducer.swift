//
// Created by Hiraku Ohno on 2018-12-07.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

func counterReducer(action: CounterAction, state: CounterState?) -> CounterState {
    var state = state ?? CounterState()

    switch action {
    case .up:
        state.count += 1
    case .down:
        state.count -= 1
    case let .setValue(value: value):
        state.count = value
    }

    return state
}
