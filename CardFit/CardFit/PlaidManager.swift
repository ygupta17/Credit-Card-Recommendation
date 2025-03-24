import Foundation
import LinkKit

class PlaidManager {
    static let shared = PlaidManager()
    
    private init() {}
    
    // You'll need to get this token from your backend
    private var linkToken: String = ""
    private var successHandler: (() -> Void)?
    
    func setLinkToken(_ token: String) {
        self.linkToken = token
    }
    
    func createPlaidHandler(onSuccess: @escaping () -> Void) throws -> Handler {
        self.successHandler = onSuccess
        
        let configuration = LinkTokenConfiguration(
            token: linkToken,
            onSuccess: { [weak self] success in
                // Handle success - send public_token to your server
                print("Public token: \(success.publicToken)")
                print("Metadata: \(success.metadata)")
                
                Task {
                    do {
                        try await PlaidService.shared.exchangePublicToken(success.publicToken)
                        DispatchQueue.main.async {
                            self?.successHandler?()
                        }
                    } catch {
                        print("Error exchanging public token: \(error)")
                    }
                }
            }
        )
        
        return try Plaid.create(configuration)
    }
} 