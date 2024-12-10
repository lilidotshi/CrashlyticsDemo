//
//  Firebase.swift
//
//  Created by Lili Shi on 10/29/24.
//

import FirebaseCore

struct Firebase {
    @discardableResult
    init() {
        FirebaseApp.configure()
    }
}
