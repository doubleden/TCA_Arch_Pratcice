//
//  CustomNavDetailStore.swift
//

import Foundation
import ComposableArchitecture

@Reducer
struct CustomNavDetailStore {
    
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        case action
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
