//
//  SecondView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    @Perception.Bindable var store: StoreOf<SecondReducer>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .ignoresSafeArea()
                VStack {
                    Text("second")
                    Button("Show Details") {
                        store.send(.showDetails)
                    }
                }
                .fullScreenCover(item: $store.scope(state: \.details, action: \.detailsAction)) { detailsReducer in
                    SecondDetailsView(store: detailsReducer)
                }
            }
        }
    }
}

