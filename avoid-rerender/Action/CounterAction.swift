//
// Created by Hiraku Ohno on 2018-12-07.
// Copyright (c) 2018 yamazakisensei. All rights reserved.
//

import ReSwift

enum CounterAction: Action {
    case up, down, setValue(value: Int)
}
