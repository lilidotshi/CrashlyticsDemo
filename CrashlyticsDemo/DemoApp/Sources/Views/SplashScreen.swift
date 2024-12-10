//
//  SplashScreen.swift
//
//  Created by Lili Shi on 10/28/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var degreesRotation = 0.0

    var body: some View {
        Text("LOADING")
            .rotationEffect(.degrees(degreesRotation))
            .onAppear {
                withAnimation(
                    .linear(duration: 0.5)
                        .speed(0.1).repeatForever(autoreverses: false)
                ) {
                    degreesRotation = 360
                }
            }
    }
}

#Preview {
    SplashScreen()
}
