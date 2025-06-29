//
//  ThirdRootView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture

struct ThirdRootView: View {
    @Perception.Bindable var store: StoreOf<ThirdRootStore>
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.stack, action: \.stack)) {
                ZStack {
                    Rectangle()
                        .fill(Color.red)
                        .ignoresSafeArea()
                    VStack {
                        Button("show details") {
                            store.send(.showDetails)
                        }
                    }
                }
            } destination: { store in
                switch store.case {
                case .thirdDetails(let detailsStore):
                    ThirdDetailsView(store: detailsStore)
                case .thirdEdit(let editStore):
                    ThirdEditView(store: editStore)
                }
            }
        }
    }
}

