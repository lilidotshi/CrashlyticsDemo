//
//  MenuViewModel.swift
//
//  Created by Lili Shi on 10/25/24.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = [.crash]

    func handleAction(for menuItem: MenuItem) {
        switch menuItem {
        case .crash:
            fatalError("This is an intentional crash")
        }
    }
}
