//
//  ThirdEditStore.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 11/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ThirdEditStore {
    
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        case backToRoot
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .backToRoot:
                return .none
            }
        }
    }
}
