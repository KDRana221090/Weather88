

import Foundation

enum LocalAuthError {
    case localAuthFailed
    case localAuthNotConfigured
    
    var errorMessage: String {
        switch self {
        case .localAuthFailed: return "Touch ID Authentication Failed"
        case .localAuthNotConfigured: return "Touch ID is not configured"
        }
      }
    }

enum LocalAuthResult {
    case success(Bool)
    case failure(LocalAuthError)
}


enum LocalAuthConstant : String{
      case message = "Please authenticate with your finger to login"
    }
