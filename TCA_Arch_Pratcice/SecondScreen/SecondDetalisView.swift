//
//  SecondDetaisView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 11/6/25.
//

import SwiftUI
import ComposableArchitecture

struct SecondDetailsView: View {
    let store: StoreOf<SecondDetailsReducer>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text(store.text)
                
                Button("Close") {
                    store.send(.closeView)
                }
            }
        }
    }
}
