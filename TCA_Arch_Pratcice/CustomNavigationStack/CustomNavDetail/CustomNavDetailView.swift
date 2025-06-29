//
//  CustomNavDetailView.swift
//

import SwiftUI
import ComposableArchitecture

struct CustomNavDetailView: View {
    let store: StoreOf<CustomNavDetailStore>
    
    var body: some View {
        VStack {
            Text("CustomNavDetailView")
        }
    }
}

#Preview {
    CustomNavDetailView(
        store: Store(initialState: CustomNavDetailStore.State()) {
            CustomNavDetailStore()
        }
    )
}
