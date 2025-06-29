//
//  AppCoreView.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import SwiftUI
import ComposableArchitecture
import SUINavigation

struct AppCoreView: View {
    let store: StoreOf<AppCoreReducer>
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStorageView {
                ZStack {
                    switch store.selectedTab {
                    case .firstTabView:
                        FirstView(store: store.scope(state: \.firstReducer, action: \.firstReducer))
                            .transition(.scale)
                    case .secondTabView:
                        SecondView(store: Store(initialState: SecondReducer.State()) {
                            SecondReducer()
                        })
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                        
                    case .thirdTabView:
                        ThirdRootView(store: Store(initialState: ThirdRootStore.State()) {
                            ThirdRootStore()
                        })
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .scale(scale: 1)))
                    case .suiNavigation:
                        CustomNavigationView(store: Store(initialState: CustomNavigationStore.State(), reducer: {
                            CustomNavigationStore()
                        }))
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .scale(scale: 1)))
                    }
                }
                .customTabBar(store: store)
                .animation(.easeInOut, value: store.selectedTab)
            }
        }
    }
}

extension View {
    func customTabBar(store: StoreOf<AppCoreReducer>) -> some View {
        modifier(CustomTabBarModifier(store: store))
    }
}

fileprivate struct CustomTabBarModifier: ViewModifier {
    let store: StoreOf<AppCoreReducer>

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { tab in
                        Button {
                            store.send(.selectTab(tab))
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: tab.image)
                                Text(tab.title)
                                    .font(.system(size: 9, weight: .semibold))
                            }
                            .foregroundColor(tab == store.selectedTab ? .black : .gray)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                        }
                    }
                }
                .background(
                    LinearGradient(
                        colors: [.red, .purple, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
            }
        }
    }
}
