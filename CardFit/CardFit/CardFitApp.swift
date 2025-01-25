import SwiftUI
import Amplify
import AWSCognitoAuthPlugin

@main
struct CardFitApp: App {
    init() {
        // Initialize Amplify when the app starts
        do {
            // Add the Auth plugin to Amplify
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured successfully.")
        } catch {
            print("Error configuring Amplify: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView() // Your ContentView
        }
    }
}
