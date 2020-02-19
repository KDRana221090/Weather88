//
//  ResponseConstant.swift
//  MVVM
//
//  Created by Apple on 19/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

enum ResponseConstant: String {
    case RESULT_OK = "ok"
    case RESULT_ERROR = "error"
    case RESULT_FAILURE = "Problem Encountered"
    case RESULT_SUCCESS = "success"
    case BLOCK_ACCOUNT = "block"
    case USER_LOGIN = "login"
    case USER_REGISTER = "user_REGISTER"
    case USER_UNAUTHENTICATED = "unauthenticated"
} 




enum NetworkError {
    case networkError
    case fetchError
    
    var errorMessage: String {
        switch self {
        case .networkError: return  "There is no internet connection, Please try again."
        case .fetchError: return "Server is not reachable, Either there is no internet or server is down."
        }
    }
}

enum NetworkResult {
    case success(Data)
    case failure(NetworkError)
}

