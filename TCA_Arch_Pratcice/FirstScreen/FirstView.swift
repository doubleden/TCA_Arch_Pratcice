//
//  FirstView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    @Perception.Bindable var store: StoreOf<FirstReducer>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .ignoresSafeArea()
                VStack {
                    Text("\(store.number)")
                    Button("go to third view", action: { store.send(.goToThirdTab) })
                    TextField("some text", text: $store.text)
                    Text(store.text)
                }
            }
        }
    }
}


