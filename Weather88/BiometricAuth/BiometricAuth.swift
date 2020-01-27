//
//  BiometricAuth.swift
//  Weather88
//
//  Created by Apple on 24/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation
import LocalAuthentication
 public class BiometricAuth {
    
    typealias CompletionHandler =  (BiometricAuthResult) -> Void
    
    class func authenticateUserWithTouchID(completionHandler: @escaping CompletionHandler) {
                let context = LAContext()
                var error: NSError?
                if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    let reason = "Please authenticate with your fingure to login"
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                        success, authenticationError in
                        DispatchQueue.main.async {
                            if success {
                                completionHandler(BiometricAuthResult.success(true))
                                } else {
                                 completionHandler(BiometricAuthResult.failure(BiometricAuthError.biometricAuthFailed))
                                }
                              }
                           }
                       } else {
                         completionHandler(BiometricAuthResult.failure(BiometricAuthError.biometricAuthNotConfigured))
                    }
                }
           }
