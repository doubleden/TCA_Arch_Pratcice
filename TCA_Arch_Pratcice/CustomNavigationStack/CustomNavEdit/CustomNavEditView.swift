//
//  CustomNavEditView.swift
//

import SwiftUI
import ComposableArchitecture

struct CustomNavEditView: View {
    let store: StoreOf<CustomNavEditStore>
    
    var body: some View {
        VStack {
            Text("CustomNavEditView")
        }
    }
}

#Preview {
    CustomNavEditView(
        store: Store(initialState: CustomNavEditStore.State()) {
            CustomNavEditStore()
        }
    )
}
