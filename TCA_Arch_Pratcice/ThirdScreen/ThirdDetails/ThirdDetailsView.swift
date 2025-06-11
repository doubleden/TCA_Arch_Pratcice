//
//  ThirdDetailsView.swift
//

import SwiftUI
import ComposableArchitecture

struct ThirdDetailsView: View {
    let store: StoreOf<ThirdDetailsStore>
    
    var body: some View {
        VStack {
            Text("ThirdDetailsView")
                .onTapGesture {
                    store.send(.showEdit)
                }
        }
    }
}

#Preview {
    ThirdDetailsView(
        store: Store(initialState: ThirdDetailsStore.State(user: User())) {
            ThirdDetailsStore()
        }
    )
}
