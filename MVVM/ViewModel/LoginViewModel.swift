 import Foundation

class LoginViewModel {
    
    
    var apiServiceHandler: APIServiceHandler
    

    init(apiServiceHandler: APIServiceHandler = .init()) {
        self.apiServiceHandler = apiServiceHandler
    }
    
    weak var delegate : LoginDelegate?
 
    
    func localAuthActionHandler() {
        LocalAuthManager.authenticateUserWithTouchID { (localAuthResult) in
             switch localAuthResult {
             case .success(let count):
                print(count)
                self.delegate?.loginSuccessfull()
            case .failure(let error):
                print(error)
                self.delegate?.loginUnsuccessfull(LoginStringConstant.Touch_Id_Title.rawValue, error.errorMessage, LoginConstants.Alert_Button.rawValue)
                break
            }
          }
       }
    
      func manualLoginHandler(_ email: String, _ password: String) {
              let dictData = ["email": email]
              self.checkPhoneNumberExistence(requestDictData: dictData)
          }
    
    
    
     func checkPhoneNumberExistence(requestDictData: [String:String]) {
        let url = RestAPIEndPoint.checkEmail
        apiServiceHandler.makeSecureRestGetAPIRequest(requestData: requestDictData, withURL: url) { [weak self]   (networkResult) in
            
            guard let self = self else {
                return
            }
          switch networkResult {
            
           case .success(let data):
                DispatchQueue.main.async {
                    do {
                        let userModel: UserModel = try DataParser.getType(from: data)
                        print(userModel)
                        if(userModel.message == ResponseConstant.RESULT_OK.rawValue) {
                            self.delegate?.loginSuccessfull()
                        } else {
                            self.delegateloginUnsuccessfullResult(LoginStringConstant.Email_Exist_Title.rawValue, LoginStringConstant.Email_Exist_Message.rawValue, LoginConstants.Alert_Button.rawValue)
                        }
                    } catch let error {
                        self.delegateloginUnsuccessfullResult(LoginStringConstant.Data_Parsing_Title.rawValue, LoginStringConstant.Data_Parsing_Message.rawValue, LoginConstants.Alert_Button.rawValue)
                        print(error.localizedDescription)
                      }
                 
                }
              case .failure(let error):
                DispatchQueue.main.async {
                    self.delegateloginUnsuccessfullResult(ResponseConstant.RESULT_FAILURE.rawValue, error.errorMessage, LoginConstants.Alert_Button.rawValue)
                }
                break
            }
        }
     }
    
    
    
    func delegateloginUnsuccessfullResult(_ title: String, _ message: String, _ buttonTitle: String) {
        self.delegate?.loginUnsuccessfull(title, message, buttonTitle)
    }
    
    
    func validateEmail(_ email: String) -> Bool {
        return email.isValidEmail()
     }
    
    
    func validatePassword(_ password: String) -> Bool {
        return password.isValidPassword()
    }
    
 }
