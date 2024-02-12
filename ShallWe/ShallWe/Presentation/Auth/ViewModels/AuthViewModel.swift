//
//  AuthViewModel.swift
//  ShallWe
//
//  Created by 김나연 on 2/12/24.
//

import AuthenticationServices

final class AuthViewModel: NSObject {
    
    override init() {}
    
    func login(email: String) {
        
    }
}

// MARK: - Extensions

extension AuthViewModel {
    func loginWithKakao() {
        
    }
    
    func loginWithApple(completion: @escaping (ASAuthorizationAppleIDRequest) -> Void) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email]
        completion(request)
    }
}

extension AuthViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        if let email = credential.email {
            print("이메일: \(email)")
            login(email: email)
        } else {
            if let tokenString = String(data: credential.identityToken ?? Data(), encoding: .utf8) {
                let email = decode(jwtToken: tokenString)["email"] as? String ?? ""
                print("이메일: \(email)")
                login(email: email)
            }
        }
        // TODO: IDENTITY_TOKEN, AUTHORIZATION_CODE를 서버에 보내줘야 할 듯
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❗️Apple login failed - \(error.localizedDescription)")
    }
    
    // MARK: - JWT decode
    
    func decode(jwtToken jwt: String) -> [String: Any] {
        func base64UrlDecode(_ value: String) -> Data? {
            var base64 = value
                .replacingOccurrences(of: "-", with: "+")
                .replacingOccurrences(of: "_", with: "/")
            
            let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
            let requiredLength = 4 * ceil(length / 4.0)
            let paddingLength = requiredLength - length
            if paddingLength > 0 {
                let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
                base64 = base64 + padding
            }
            return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
        }
        
        func decodeJWTPart(_ value: String) -> [String: Any]? {
            guard let bodyData = base64UrlDecode(value),
                  let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
                return nil
            }
            
            return payload
        }
        
        let segments = jwt.components(separatedBy: ".")
        return decodeJWTPart(segments[1]) ?? [:]
    }
}
