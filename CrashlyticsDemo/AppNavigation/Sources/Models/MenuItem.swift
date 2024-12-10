//
//  MenuItem.swift
//
//  Created by Lili Shi on 10/25/24.
//

enum MenuItem: Int, Identifiable {
    var id: Int { rawValue }

    enum MenuItemType {
        case automatic
    }

    case crash

    var title: String {
        switch self {
        case .crash:
            return "Crash"
        }
    }

    var type: MenuItemType {
        switch self {
        case .crash:
            return .automatic
        }
    }

    var showRightChevron: Bool {
        switch self {
        case .crash:
            return false
        }
    }
}
