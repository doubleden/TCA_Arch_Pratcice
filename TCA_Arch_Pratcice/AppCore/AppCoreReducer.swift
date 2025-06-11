//
//  ContentReducer.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct  AppCoreReducer {
    @ObservableState
    struct State {
        var selectedTab = TabItem.firstTabView
        var firstReducer = FirstReducer.State()
    }
    
    enum Action {
        case selectTab(TabItem)
        case firstReducer(FirstReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.firstReducer, action: \.firstReducer) {
            FirstReducer()
        }
        
        Reduce { state, action in
            switch action {
            case .selectTab(let tab):
                if tab == .firstTabView {
                    state.firstReducer.number = 2
                    state.firstReducer.user = User()
                }
                state.selectedTab = tab
                return .none
                
            case .firstReducer(.goToThirdTab):
                state.selectedTab = .thirdTabView
                return .none
                
            default:
                return .none
            }
        }
    }
}
