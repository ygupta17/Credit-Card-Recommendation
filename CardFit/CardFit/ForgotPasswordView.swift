import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    
    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 40)
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                .padding(.bottom, 20)
            
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            Button(action: resetPassword) {
                Text("Reset Password")
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
    
    func resetPassword() {
        print("Reset password logic for email: \(email)")
    }
}

