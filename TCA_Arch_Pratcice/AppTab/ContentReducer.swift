//
//  ContentReducer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct  ContentReducer {
    @ObservableState
    struct State: Equatable {
        var text = ""
    }
    
    enum Action {
        case setRandomText
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .setRandomText:
                state.text = String(Int.random(in: 1...100))
                return .none
            }
        }
    }
}
