//
//  LoginConstants.swift
//  MVVM
//
//  Created by Apple on 17/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

enum LoginConstants : String{
    case LoginButton = "Login"
    case Alert_Button = "Okay"
}

enum LoginStringConstant: String {
    
    case Email_Exist_Title = "Email already registered"
    case Email_Exist_Message = "This email address is aleady registered with us, Please user different email to continue."
    
    
    case  Data_Parsing_Title = "Error"
    case  Data_Parsing_Message = "There is some problem in parsing the data from server."
    
    
    case  Touch_Id_Title = "No Success"
    
}



enum LoginErrorHandlingString: String {
    
    case invalid_email = "    Expecting a valid email"
    case invalid_password = "    Week password"
    
}



