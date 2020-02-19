//
//  ViewController.swift
//  MVVM
//
//  Created by Apple on 17/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit

class LoginViewController: BaseController {
    
    
    var loginVieModel = LoginViewModel()
    
    
    
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var emailTextField: TweeAttributedImageLendingTextField!
    @IBOutlet var passwordTextField: TweeAttributedImageLendingTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiliseViewModel()
        self.preUiSetUp()
        self.initialiseTextFieldDelegate()
        
       }
    
    
    func initialiseTextFieldDelegate() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func initiliseViewModel() {
        self.loginVieModel.delegate = self
    }
    
    
    
    func preUiSetUp() {
        loginButton.makeRoundButton()
        loginButton.setTitle(title: LoginConstants.LoginButton.rawValue)
        loginButton.disableButton()
     }
    
    
     @IBAction func touchIdActionButton(_ sender: Any) {
         super.showLoader()
         loginVieModel.localAuthActionHandler()
       }
    
    
    
    @IBAction func manualLoginActionButton(_ sender: Any) {
        super.showLoader()
        loginVieModel.manualLoginHandler(emailTextField.text!, passwordTextField.text!)
       }
     }






extension LoginViewController: LoginDelegate {
    
    
    func loginUnsuccessfull(_ title: String, _ message: String, _ buttonTitle: String) {
        super.hideLoader()
        DisplayAlertController.getInstance.showBasicAlertWithOneAction1(title: title, message: message, buttonText: buttonTitle, controller: self, completedWithBtnStr: nil)
        
        
         }
    
     func loginSuccessfull() {
        super.hideLoader()
        
       }
   }




extension LoginViewController: UITextFieldDelegate {
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            if(loginVieModel.validateEmail(textField.text!)) {
                 validTextFieldEntry(emailTextField)
              } else {
                invalidTextFieldEntry(LoginErrorHandlingString.invalid_email.rawValue, emailTextField)
              }
          } else if textField == passwordTextField {
            if(loginVieModel.validatePassword(textField.text!)) {
                 validTextFieldEntry(passwordTextField)
             } else {
                invalidTextFieldEntry(LoginErrorHandlingString.invalid_password.rawValue, passwordTextField)
             }
          }
        let maxLength = Constant.textFieldLimit
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func validTextFieldEntry(_ textField: TweeAttributedImageLendingTextField) {
        loginButton.enableButton()
        TextFieldUtils.validInputData(textField)
    }
    
    func invalidTextFieldEntry(_ errorMessage: String, _ textField: TweeAttributedImageLendingTextField) {
        TextFieldUtils.showErrorMessage(errorMessage: errorMessage, textField)
        loginButton.disableButton()
    }
   
    
}

