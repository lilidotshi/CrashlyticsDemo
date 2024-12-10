import AppNavigation
import SwiftUI

struct AppView: View {
    @State private var showMenu = false
    var body: some View {
        VStack {
            Button("Show Menu") {
                showMenu = true
            }
        }
        .sheet(isPresented: $showMenu) {
            MenuView()
        }
    }
}

#Preview {
    AppView()
}
