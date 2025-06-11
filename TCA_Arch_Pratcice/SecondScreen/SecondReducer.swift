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
    struct State {
        @Presents var details: SecondDetailsReducer.State?
    }
    
    enum Action {
        case detailsAction(PresentationAction<SecondDetailsReducer.Action>)
        case showDetails
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showDetails:
                state.details = .init(text: "Hi from parent")
                return .none
            default:
                return .none
            }
        }
        .ifLet(\.$details, action: \.detailsAction) {
            SecondDetailsReducer()
        }
    }
}
