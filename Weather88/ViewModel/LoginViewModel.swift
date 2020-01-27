//
//  LoginViewModel.swift
//  Weather88
//
//  Created by Apple on 27/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

class LoginViewModel {
    
     weak var customDelegate: LoginDelegate?
    
    
    func checkUserCred(_ email: String, _ password: String) {
        
        let emailLocal = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.EMAIL_ADDESS.rawValue)
        let passwordLocal = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.PASSWORD.rawValue)
        
       if(emailLocal == email && passwordLocal == password) {
            customDelegate?.handleLogin(1)
        } else {
            customDelegate?.handleLogin(0)
        }
        
     }
    
}
