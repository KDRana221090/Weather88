//
//  TextFieldUtils.swift
//  MVVM
//
//  Created by Apple on 19/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation
import UIKit


class Constant {
    static var textFieldLimit: Int  = 40
    static var allowASCIICharacterInTextField: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    static var allowSpecialCharacterInTextField: String = "~!@#$%^&*()_-{}[]|.:;?><"
    static var allowCharacterInTextField: String = allowASCIICharacterInTextField + allowSpecialCharacterInTextField
    
}


class TextFieldUtils {
    
    class func showErrorMessage(errorMessage: String, _ textField: TweeAttributedImageLendingTextField) {
        textField.showInfo(errorMessage, animated: true)
        textField.placeholderColor = UIColor.red
        textField.activeLineColor = UIColor.red
        textField.textColor = UIColor.red
    }
    
    
    class func validInputData(_ textField: TweeAttributedImageLendingTextField) {
        textField.placeholderColor = UIColor.appTextColor()
        textField.activeLineColor = UIColor.appTextColor()
        textField.textColor = UIColor.appTextColor()
        hideErrorMessage(textField)
    }
    
    
    
   class func hideErrorMessage(_ textField: TweeAttributedImageLendingTextField) {
         textField.hideInfo()
    }
    
    
    
}
