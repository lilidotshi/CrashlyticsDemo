//
//  MenuView.swift
//  Home
//
//  Created by Lili Shi on 10/25/24.
//

import SwiftUI

public struct MenuView: View {
    @StateObject private var model = MenuViewModel()

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                ForEach(model.menuItems) { item in
                    Button {
                        model.handleAction(for: item)
                    } label: {
                        Text(item.title)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
