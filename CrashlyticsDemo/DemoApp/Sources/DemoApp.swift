//
//  DemoApp.swift
//
//  Created by Lili Shi on 10/7/24.
//

import SwiftUI

@main
struct DemoApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: DemoAppDelegate

    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
