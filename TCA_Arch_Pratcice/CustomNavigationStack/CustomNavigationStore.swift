//
//  CustomNavigationStore.swift
//

import Foundation
import ComposableArchitecture

@Reducer
struct CustomNavigationStore {
    
    @ObservableState
    struct State {
        var stack: [CustomNavigationDestination] = []
    }
    
    enum Action {
        case showEdit(StoreOf<CustomNavEditStore>)
        case showDetail(StoreOf<CustomNavDetailStore>)
        case showMenu(StoreOf<CustomNavMenuStore>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showDetail(let store):
                state.stack.append(.detail(store))
                return .none
            case .showMenu(let store):
                state.stack.append(.menu(store))
                return .none
            default:
                return .none
            }
        }
    }
}

enum CustomNavigationDestination {
    case menu(StoreOf<CustomNavMenuStore>)
    case detail(StoreOf<CustomNavDetailStore>)
    case edit(StoreOf<CustomNavEditStore>)
}
