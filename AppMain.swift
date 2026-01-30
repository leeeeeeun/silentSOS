import SwiftUI

@main
struct SilentSOSApp: App {
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .navigationViewStyle(StackNavigationViewStyle()) 
        }
    }
}