//
//  FirstView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: StoreOf<FirstReducer>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("\(store.number)")
                Button("go to third view", action: { store.send(.goToThirdTab) })
            }
        }
    }
}


