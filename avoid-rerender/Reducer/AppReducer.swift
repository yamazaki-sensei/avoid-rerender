//
// Created by Hiraku Ohno on 2018-12-07.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import ReSwift

func appResucer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case let action as CounterAction:
        state.counterState = counterReducer(action: action, state: state.counterState)
    default:
        break
    }

    return state
}