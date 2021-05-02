//
//  LonginVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit
import LanguageManager_iOS
import Loaf
import SVProgressHUD
class LonginVC: UIViewController {
    var switchLanguage = LanguageDetails()

    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var txtemail: SkyFloatingLabelTextField!
    @IBOutlet weak var btnLogin: UIButton!
    // MARK:- Outlets
    @IBOutlet weak var lblSignUpInfo             : UILabel!
    @IBOutlet weak var viewBackUserID            : UIView!
    @IBOutlet weak var viewBackPassword          : UIView!
    
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        if  LanguageManager.shared.isRightToLeft == true {
          
            switchLanguage.changeLanguageTo(lang: "ar")
                 UIView.appearance().semanticContentAttribute = .forceRightToLeft
         
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
                
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            switchLanguage.changeLanguageTo(lang: "en")
        }
    }
    
    // MARK:- SetUpView
    private func setUpView() {
       
        viewBackUserID.setBorder(with: .app_Green, 1)
        viewBackPassword.setBorder(with: .app_Green, 1)
        lblSignUpInfo.halfTextColorChange(fullText:  "If you don't have an account? Sign Up".localiz(), changeText:"SignUp".localiz() , fontColor: .app_Green)
        lblSignUpInfo.isUserInteractionEnabled = true
        lblSignUpInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
        self.hideKeyboardWhenTappedAround()
        self.btnLogin.setTitle("Log in as customer".localiz(), for: .normal)
        self.txtemail.placeholder = "User id".localiz()
        self.txtPassword.placeholder = "Password".localiz()
    }
    
    // MARK:- Button Actions
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let text = lblSignUpInfo.attributedText?.string else {
            return
        }

       // if let range = text.range(of: "Sign Up"),
         //   recognizer.didTapAttributedTextInLabel(label: lblSignUpInfo, inRange: NSRange(range, in: text)) {
            pushSignUpVC()
      //  }
    }
    
    // MARK:- Push Methods
    private func pushSignUpVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: SignUpVC.self)) as? SignUpVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        
        
        if txtemail.text == "" {
            Loaf("Please enter Email.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else  if  isValidEmail(testStr:txtemail.text ?? "") == false
        {
            Loaf("Please enter valid Email id.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else  if txtPassword.text == "" {
            Loaf("Please enter password.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else{
            SVProgressHUD.show()
            wsLoginUser()
        }
       

        
    }
    func isValidEmail(testStr:String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: testStr)
   }
    // MARK:- Custom Methods
    func wsLoginUser() {
        let parameters = [ "email": txtemail.text ??  "",
                          "password": txtPassword.text ?? "",
                          ] as [String : Any]
        let url = WSRequest.LoginUser()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                     let userDetails = responseDict["user_details"] as? NSDictionary
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                        let user_id = userDetails?["id"] as? Int
                        let  mobileNumber = userDetails?["mobile_number"] as? String
                        let  fullname = userDetails?["full_name"] as? String
                        let  city = userDetails?["city"] as? String
                        
                        
                        Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.user_id, Value: "\(user_id ?? 0)")
                        Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.MobileNumber, Value: mobileNumber ?? "")
                        Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.full_name, Value: fullname ?? "")
                        Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.city, Value: city ?? "")
                        UserDefaults.standard.set(true, forKey: User_defaults_Constants.LOGGED_IN)
                        UserDefaults.standard.synchronize()
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
                        self.navigationController?.pushViewController(vc, animated: true)
                        Loaf("You have login  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                       
                    
                    }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
} //class


