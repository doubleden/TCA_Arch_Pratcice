//
//  CustomNavMenuView.swift
//

import SwiftUI
import ComposableArchitecture

struct CustomNavMenuView: View {
    let store: StoreOf<CustomNavMenuStore>
    
    var body: some View {
        VStack {
            Text("CustomNavMenuView")
        }
    }
}

#Preview {
    CustomNavMenuView(
        store: Store(initialState: CustomNavMenuStore.State()) {
            CustomNavMenuStore()
        }
    )
}
