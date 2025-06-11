//
//  FirstReducer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct FirstReducer {
    
    @ObservableState
    struct State {
        var number = 0
        var user = User()
        var text = ""
    }
    
    enum Action: BindableAction {
        case goToThirdTab
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .goToThirdTab:
                    return .none // Как бы делегирует в родительское вью
            case .binding(\.text):
                print("validation")
                return .none
            default:
                return .none
            }
        }
    }
}
