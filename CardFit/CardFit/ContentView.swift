//
//  ContentView.swift
//  CardFit
//
//  Created by Yash Gupta on 12/1/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//            Text("Testing")
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggingIn = false // Track login state
    @State private var loginError: String? = nil // Store any login errors
    @State private var isLoggedIn = false // Track if the user is logged in

    var body: some View {
        VStack {
            //Title of application
            Text("CardFit")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 40)
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))

            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray5))
                .padding(.horizontal, 20)
                
                    
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray5))
                .padding(.horizontal, 20)
            
            if let error = loginError { // Display error message if any
                                Text(error)
                                    .foregroundColor(.red)
                                    .padding(.top, 8)
                            }

            Button("Login") {
                // Add your login logic here
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 95/255, green: 69/255, blue: 223/255))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
            HStack{
                Button("Forgot Password?") {
                    // Navigate to Forgot Password screen
                    print("Forgot Password tapped")
                }
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                .padding(.top, 8)

                Button("Create Account") {
                    // Navigate to Create Account screen
                    print("Create Account tapped")
                }
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                .padding(.top, 8)
            }
            .padding(.bottom, 40)
        }
        .padding(.top, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

