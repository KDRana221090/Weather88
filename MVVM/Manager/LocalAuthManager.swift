//
//  BiometricAuth.swift
//  Weather88
//
//  Created by Apple on 24/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation
import LocalAuthentication
 public class LocalAuthManager {
    
    typealias CompletionHandler =  (LocalAuthResult) -> Void
    
    class func authenticateUserWithTouchID(completionHandler: @escaping CompletionHandler) {
                let context = LAContext()
                var error: NSError?
                if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    let reason = LocalAuthConstant.message.rawValue
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                        success, authenticationError in
                        DispatchQueue.main.async {
                            if success {
                                completionHandler(LocalAuthResult.success(true))
                                } else {
                                 completionHandler(LocalAuthResult.failure(LocalAuthError.localAuthFailed))
                                }
                              }
                            }
                         } else {
                         completionHandler(LocalAuthResult.failure(LocalAuthError.localAuthNotConfigured))
                     }
                  }
              }
