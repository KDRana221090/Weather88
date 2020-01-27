//
//  InAppEnumConstant.swift
//  Weather88
//
//  Created by Apple on 24/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

 enum BiometricAuthError {
    case biometricAuthFailed
    case biometricAuthNotConfigured
    
    var errorMessage: String {
        switch self {
        case .biometricAuthFailed: return "Touch ID Authentication Failed"
        case .biometricAuthNotConfigured: return "Touch ID is not configured"
        }
      }
   }

 enum BiometricAuthResult {
    case success(Bool)
    case failure(BiometricAuthError)
}




public enum DeviceScreenType {
    case iPhones_4_4S
    case iPhones_5_5s_5c_SE
    case iPhones_6_6s_7_8
    case iPhones_6Plus_6sPlus_7Plus_8Plus
    case iPhones_X_XS
    case iPhone_XR
    case iPhone_XSMax
    case unknown
}

