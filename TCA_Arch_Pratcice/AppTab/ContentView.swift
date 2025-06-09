//
//  ContentView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<ContentReducer>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                if !store.text.isEmpty {
                    Text(store.text)
                        .transition(.scale)
                }
                
                Button("Set random number", action: {
                    store.send(.setRandomText, animation: .linear)
                })
            }
            .padding()
        }
    }
}
