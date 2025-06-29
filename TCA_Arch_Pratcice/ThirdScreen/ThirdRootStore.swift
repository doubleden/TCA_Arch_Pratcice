//
//  ThirdReduceer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ThirdRootStore {
    
    @ObservableState
    struct State: Equatable {
        var stack = StackState<Destination.State>()
    }
    
    enum Action {
        case stack(StackActionOf<Destination>)
        case showDetails
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showDetails:
                state.stack.append(Destination.State.thirdDetails(ThirdDetailsStore.State(user: User())))
                return .none
            case .stack(.element(id: _, action: .thirdDetails(.showEdit))):
                state.stack.append(Destination.State.thirdEdit(ThirdEditStore.State()))
                return .none
            case .stack(.element(id: _, action: .thirdEdit(.backToRoot))):
                state.stack.removeAll()
                return .none
            default:
                  return .none
            }
        }
        .forEach(\.stack, action: \.stack)
    }
}

// MARK: - Destination
extension ThirdRootStore {
    @Reducer
    enum Destination {
        case thirdEdit(ThirdEditStore)
        case thirdDetails(ThirdDetailsStore)
        
        @ObservableState
        enum State: CaseReducerState, Equatable {
            typealias StateReducer = Destination
            
            case thirdEdit(ThirdEditStore.State)
            case thirdDetails(ThirdDetailsStore.State)
        }
    }
    
}
