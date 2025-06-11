//
//  ThirdDetailsStore.swift
//

import Foundation
import ComposableArchitecture

@Reducer
struct ThirdDetailsStore {
    
    @ObservableState
    struct State {
        let user: User
    }
    
    enum Action {
        case showEdit
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showEdit:
                return .none
            }
        }
    }
}
