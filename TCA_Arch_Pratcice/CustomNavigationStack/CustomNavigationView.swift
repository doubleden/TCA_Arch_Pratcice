//
//  SUIRootView.swift
//

import SwiftUI
import ComposableArchitecture

struct CustomNavigationView: View {
    let store: StoreOf<CustomNavigationStore>
    
    private var lastItemInStack: CustomNavigationDestination { store.stack.last ?? .menu(Store(initialState: CustomNavMenuStore.State(), reducer: {
        CustomNavMenuStore()
    }))
    }
    
    var body: some View {
        ZStack {
            switch lastItemInStack {
            case .menu(let store):
                CustomNavMenuView(store: store)
                    .transition(.scale)
            case .detail(let store):
                CustomNavDetailView(store: store)
                    .transition(.scale)
            case .edit(let store):
                CustomNavEditView(store: store)
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    CustomNavigationView(
        store: Store(initialState: CustomNavigationStore.State()) {
            CustomNavigationStore()
        }
    )
}
