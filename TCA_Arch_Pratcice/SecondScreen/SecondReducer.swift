//
//  SecondReducer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SecondReducer {
    
    @ObservableState
    struct State {}
    
    enum Action {
        case goToThirdTab
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .goToThirdTab:
                    .none
            }
        }
    }
}
