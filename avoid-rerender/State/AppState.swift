//
// Created by Hiraku Ohno on 2018-12-07.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var counterState = CounterState()
}

extension AppState: Equatable {
    public static func ==(lhs: AppState, rhs: AppState) -> Bool {
        return lhs.counterState == rhs.counterState
    }
}

