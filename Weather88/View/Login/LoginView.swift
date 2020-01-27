//
//  LoginView.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//


import UIKit
import GoogleSignIn

class LoginView: BaseController, UITextFieldDelegate, LoginDelegate {
    
    
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    var activeField: UITextField?
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var touchIdButton: UIButton!
    
    @IBOutlet var loginWithGmailId: UIButton!
    
    
    @IBOutlet var emailTextField: TweeAttributedImageLendingTextField!
    
    
    @IBOutlet var passwordTextField: TweeAttributedImageLendingTextField!
    
 
    @IBOutlet weak var firstNameTextField: TweeAttributedImageLendingTextField!
    @IBOutlet weak var lastNameTextField: TweeAttributedImageLendingTextField!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
       self.UIInitialise()
       self.emailTextField.delegate=self
       self.passwordTextField.delegate=self
       self.registerForNotification()
        
     }
    
    func registerForNotification(){
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    
    func UIInitialise() {
         self.loginButton.disableButton()
        
    }
    
    func isValidEmail(emailToVerify:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailToVerify)
    }
    
    
    
    
   @IBAction func authenticateWithTouchId(_ sender: Any) {
         BiometricAuth.authenticateUserWithTouchID { (biometricAuthResult) in
            print(biometricAuthResult)
            switch biometricAuthResult {
            case .success(let count):
                print("\(count)")
                 self.dashboard()
            case .failure(let error):
                print("Error is given as: ")
                print(error)
                break
             }
           }
         }
    
    
    
    func dashboard() {
        AppConfigManager.shared.setData(data: "YES", dataKey: AppConfigManagerConst.HAS_USER_LOGGED_IN.rawValue)
        super.showLoader(message: "Please wait...")
        let storyboard = UIStoryboard(name: "WeatherViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherViewControllerID") as UIViewController
        self.present(vc, animated:true, completion: nil)
       }
    
    
    
    @IBAction func signInUsingGmailAction(_ sender: Any) {
         GIDSignIn.sharedInstance().signIn()
    }
    
    
    
    @IBAction func manuallyLoginActionButton(_ sender: Any) {
        super.showLoader(message: "Please wait...")
        loginViewModel.customDelegate = self
        loginViewModel.checkUserCred(emailTextField.text!, passwordTextField.text!)
     }
    
    func handleLogin(_ result: Int) {
        super.hideLoader()
         if(result == 1) {
           self.dashboard()
        } else {
            DisplayAlertController.getInstance.showBasicAlertWithNoAction(title: "Unable to login", message: "Unable to login, Please provide valid email and password", buttonText: "Okay", controller: self)
          }
       }
    
    
    
    
    @IBAction func saveActionButton(_ sender: Any) {
       //  PageNavigation.getInstance.moveToNextPage(storyboardName: StoryboardNames.LoanEligibilityCheckResult.rawValue, controller: self)
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func showErrorMessage(errorMessage: String) {
    self.emailTextField.showInfo(errorMessage, animated: true)
    self.emailTextField.placeholderColor = UIColor.red
    self.emailTextField.activeLineColor = UIColor.red
    self.emailTextField.textColor = UIColor.red
    }
    
    func hideErrorMessage() {
        self.emailTextField.hideInfo()
    }
    
    
    
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.scrollView.isScrollEnabled = true
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height+30, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if activeField != nil {
            if (!aRect.contains(activeField!.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let info : NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height+30, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
        fixScrollView()
    }
    func fixScrollView() {
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    
    
    
    
    
  }


//////////////////////// Extension of View Controller /////////////////////////


extension LoginView {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            textField.resignFirstResponder()
            return true
        }
        return true
     }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.superview?.backgroundColor = UIColor.white
        if textField == emailTextField {
            
//            if(isValidEmail(emailToVerify: emailTextField.text!)) {
//                hideErrorMessage()
//                self.loginButton.enableButton()
//                emailTextField.placeholderColor = UIColor.appTextColor
//                emailTextField.activeLineColor = UIColor.appTextColor
//                emailTextField.textColor = UIColor.appTextColor
//
//            } else {
//                showErrorMessage(errorMessage: "    Expecting a valid email")
//                self.loginButton.disableButton()
//
//            }
            
        } else if textField == passwordTextField {
            
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            
            if(isValidEmail(emailToVerify: emailTextField.text!)) {
                hideErrorMessage()
                self.loginButton.enableButton()
                emailTextField.placeholderColor = UIColor.gray
                emailTextField.activeLineColor = UIColor.gray
                emailTextField.textColor = UIColor.gray
                
            } else {
                showErrorMessage(errorMessage: "    Expecting a valid email")
                self.loginButton.disableButton()
                
            }
        
          } else if textField == passwordTextField {
            passwordTextField.placeholderColor = UIColor.gray
            passwordTextField.activeLineColor = UIColor.gray
            passwordTextField.textColor = UIColor.gray
          }
        return true
    }
    
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            if(isValidEmail(emailToVerify: emailTextField.text!)) {
                hideErrorMessage()
                self.loginButton.enableButton()
                emailTextField.placeholderColor = UIColor.appTextColor
                emailTextField.activeLineColor = UIColor.appTextColor
                emailTextField.textColor = UIColor.appTextColor
                
            } else {
                showErrorMessage(errorMessage: "    Expecting a valid email")
                self.loginButton.disableButton()
                
            }
        } else if textField == passwordTextField {
            
        }
        
        let maxLength = Constant.textFieldLimit
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return  /* string.containsValidCharacter && */ newString.length <= maxLength
    }

 
    
    
    
    
}



class Constant {
    static var textFieldLimit: Int  = 40
    static var allowASCIICharacterInTextField: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    static var allowSpecialCharacterInTextField: String = "~!@#$%^&*()_-{}[]|.:;?><"
    static var allowCharacterInTextField: String = allowASCIICharacterInTextField + allowSpecialCharacterInTextField
    
}

//
//
extension LoginView: GIDSignInDelegate {
 



@available(iOS 9.0, *)
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    return GIDSignIn.sharedInstance().handle(url)
}

func application(_ application: UIApplication,
                 open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    return GIDSignIn.sharedInstance().handle(url)
}

func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
          withError error: Error!) {
    if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
        } else {
            print("\(error.localizedDescription)")
        }
        return
      }
       dashboard()
    }

func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
          withError error: Error!) {
    }


}
