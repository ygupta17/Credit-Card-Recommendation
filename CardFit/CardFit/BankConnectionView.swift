import SwiftUI

struct BankConnectionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isConnecting = false
    @State private var error: String? = nil
    @State private var showSuccessAlert = false
    
    private let accentColor = Color(red: 95/255, green: 69/255, blue: 223/255)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Header
                Text("Connect Your Bank")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(accentColor)
                    .padding(.top, 40)
                
                // Bank icon
                Image(systemName: "building.columns.fill")
                    .font(.system(size: 60))
                    .foregroundColor(accentColor)
                    .padding(.top, 20)
                
                // Description
                VStack(spacing: 16) {
                    Text("Secure Bank Connection")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Connect your bank account to get personalized credit card recommendations based on your spending habits.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 32)
                }
                
                // Security features
                VStack(spacing: 12) {
                    SecurityFeatureRow(icon: "lock.fill", text: "Bank-level security")
                    SecurityFeatureRow(icon: "eye.slash.fill", text: "Your credentials are never stored")
                    SecurityFeatureRow(icon: "hand.raised.fill", text: "You're always in control")
                }
                .padding(.vertical, 20)
                
                Spacer()
                
                // Connect button
                Button(action: connectBank) {
                    HStack {
                        if isConnecting {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .padding(.trailing, 8)
                        }
                        Text(isConnecting ? "Connecting..." : "Connect Bank")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
                .disabled(isConnecting)
                
                // Skip button
                Button(action: { dismiss() }) {
                    Text("Skip for now")
                        .foregroundColor(accentColor)
                }
                .padding(.bottom, 40)
            }
            .alert("Error", isPresented: .constant(error != nil)) {
                Button("OK") { error = nil }
            } message: {
                Text(error ?? "")
            }
            .alert("Success", isPresented: $showSuccessAlert) {
                Button("Continue") {
                    dismiss()
                }
            } message: {
                Text("Your bank account has been successfully connected!")
            }
        }
    }
    
    private func connectBank() {
        isConnecting = true
        error = nil
        
        Task {
            do {
                let linkToken = try await PlaidService.shared.getLinkToken()
                PlaidManager.shared.setLinkToken(linkToken)
                let handler = try PlaidManager.shared.createPlaidHandler {
                    self.showSuccessAlert = true
                }
                
                DispatchQueue.main.async {
                    handler.open(presentUsing: .viewController)
                    isConnecting = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error.localizedDescription
                    self.isConnecting = false
                }
            }
        }
    }
}

struct SecurityFeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(Color(red: 95/255, green: 69/255, blue: 223/255))
                .font(.system(size: 20))
            Text(text)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.horizontal, 32)
    }
}

struct BankConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        BankConnectionView()
    }
} 