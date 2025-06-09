//
//  TabItem.swift
//  TCA_Arch_Pratcice
//
//  Created by Denis Denisov on 9/6/25.
//

import Foundation

enum TabItem: CaseIterable {
    case firstTabView
    case secondTabView
    case thirdTabView
    
    var image: String {
        switch self {
        case .firstTabView: "1.circle"
        case .secondTabView: "2.circle"
        case .thirdTabView: "3.circle"
        }
    }

    var title: String {
        switch self {
        case .firstTabView: "screen 1"
        case .secondTabView: "screen 2"
        case .thirdTabView: "screen 3"
        }
    }
    
    var id: Int {
        switch self {
        case .firstTabView: 1
        case .secondTabView: 2
        case .thirdTabView: 3
        }
    }
}
