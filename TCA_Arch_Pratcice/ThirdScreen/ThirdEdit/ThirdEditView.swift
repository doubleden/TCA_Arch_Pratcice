//
//  ThirdEditView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 11/6/25.
//

import SwiftUI
import ComposableArchitecture

struct ThirdEditView: View {
    let store: StoreOf<ThirdEditStore>
    
    var body: some View {
        VStack {
            Text("Back to root")
                .onTapGesture {
                    store.send(.backToRoot)
                }
        }
    }
}

#Preview {
    ThirdEditView(store: Store(initialState: ThirdEditStore.State()) {
        ThirdEditStore()
    })
}
