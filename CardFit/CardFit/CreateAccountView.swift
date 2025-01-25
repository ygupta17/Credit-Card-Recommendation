import SwiftUI

struct CreateAccountView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 40)
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                .padding(.bottom, 20)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            Button(action: createAccount) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 95/255, green: 69/255, blue: 223/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.top, 20)
        }
        .padding()
    }
    
    func createAccount() {
        print("Create account logic for username: \(username), email: \(email)")
    }
}

