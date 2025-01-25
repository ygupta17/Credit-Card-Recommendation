
import SwiftUI
import Amplify

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggingIn = false
    @State private var loginError: String? = nil
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Title of application
                Text("CardFit")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                
                // Username text field
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray5))
                    .padding(.horizontal, 20)
                
                // Password field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray5))
                    .padding(.horizontal, 20)
                
                // Display login error if exists
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.top, 8)
                }
                
                // Login button
                Button(action: loginUser) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 95/255, green: 69/255, blue: 223/255))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                HStack {
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot Password?")
                            .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                    }
                    .padding(.top, 8)
                    
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Create Account")
                            .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                    }
                    .padding(.top, 8)
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 40)
        }
    }
    
    func loginUser() {
        isLoggingIn = true
        loginError = nil
        
        Task {
            do {
                let signInResult = try await Amplify.Auth.signIn(username: username, password: password)
                isLoggingIn = false
                if signInResult.isSignedIn {
                    print("Login successful!")
                    isLoggedIn = true
                } else {
                    loginError = "Sign-in failed"
                }
            } catch let error as AuthError {
                isLoggingIn = false
                loginError = "Error: \(error.localizedDescription)"
            } catch {
                isLoggingIn = false
                loginError = "Unexpected error: \(error)"
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
