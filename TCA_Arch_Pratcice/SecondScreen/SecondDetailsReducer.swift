//
//  SecondDetailsReducer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 11/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SecondDetailsReducer {
    
    @ObservableState
    struct State {
        var text: String
    }
    
    enum Action {
        case closeView
    }
    
    @Dependency(\.dismiss) private var dismiss
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .closeView:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}


