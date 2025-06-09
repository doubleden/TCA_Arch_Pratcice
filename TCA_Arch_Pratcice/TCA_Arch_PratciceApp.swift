//
//  TCA_Arch_PratciceApp.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import  ComposableArchitecture

@main
struct TCA_Arch_PratciceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: ContentReducer.State()) {
                    ContentReducer()
                }
            )
        }
    }
}
