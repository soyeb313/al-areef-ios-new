//
//  OTPVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit
import Loaf
import SVProgressHUD
class OTPVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var viewOTP          : OTPView!
    @IBOutlet weak var btnResent        : UIButton!
    @IBOutlet weak var lblDescrition        : UILabel!
    @IBOutlet weak var lblEnterCode        : UILabel!
    
    @IBOutlet weak var btnComplete: UIButton!
    var fullName = ""
    var gender = ""
    var email = ""
    var phonenumber  = ""
    var specialID = ""
    var userID = ""
    var password = ""
    
    var lastName = ""
    var street = ""
    var area = ""
    var country = ""
    var city = ""
    var Preferredlang = ""
    var Agegroup = ""
    // MARK:- Variables
    var otp = ""
    var isFromConsultantRegsitration = false
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.viewOTP.setUpView(5, strPinValue: otp)
        self.btnResent.setCornerRadius(radius: 5)
        self.btnResent.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnComplete.setTitle("Completes".localiz(), for: .normal)
        btnResent.setTitle("Resend".localiz(), for: .normal)
        lblDescrition.text = "If you have not received your OTP code, you can press The re-transmitter button below to get a new code.".localiz()
        lblEnterCode.text = "Enter the OTP code".localiz()
    }
    
    // MARK:- Button Actions
    
    
    // MARK:- Push Methods
    private func pushSelectPlanVC() {
        guard let vc = UIStoryboard.Company.instantiateViewController(withIdentifier: String(describing: SelectPlanVC.self)) as? SelectPlanVC else { return }
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
    @IBAction func btnComplete(_ sender: Any) {
        if  isFromConsultantRegsitration {
            pushSelectPlanVC()
        }else {
            pushQuestionnaireFormVC()
            if self.viewOTP.getPin() == "" {
                Loaf("Please enter OTP ".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()

            }else
            {
                SVProgressHUD.show()
                wsVerifyOTp()
            }
        }
    }
    @IBAction func btnResnet(_ sender: Any) {
        pushQuestionnaireFormVC()
        if self.viewOTP.getPin() == "" {
            Loaf("Please enter OTP ".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            
        }else
        {
            SVProgressHUD.show()
            
            wsReSendOtp()
        }
        
        
    }
    func wsReSendOtp() {
        
        
        let parameters = [ "user_type": 1,
                           "mobile_number": phonenumber ,
                           "user_id" :  1 ] as [String : Any]
        
        
        let url = WSRequest.SendOtp()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
                self.otp = "\( responseDict["Otp"] as? Int ?? 0)"
                DispatchQueue.main.async {
                    self.viewOTP.setPin(strPin: self.otp)
                    Loaf("OTP sent sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                    
                    
                }
            }
            
        }
    }
    
    func wsVerifyOTp() {
        
        
        let parameters = [ "otp": self.viewOTP.getPin(),
                           "user_id" :  1 ] as [String : Any]
        let url = WSRequest.VerifyOtp()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                let message = "\(String(describing:result))"
                print(message)
                DispatchQueue.main.async {
                    self.wsCustomerRegistration()
                    //                    Loaf("OTP verify sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                    
                }
            }
            
        }
        
    }
    
    func pushQuestionnaireFormVC(){
        guard let vc = UIStoryboard.Customer.instantiateViewController(withIdentifier: String(describing: QuestionnaireFormVC.self)) as? QuestionnaireFormVC else { return }
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func wsCustomerRegistration() {
        
        let parameters = [ "mobile_number": phonenumber,
                           "username" :  "AF1",
                           "password": password,
                           "full_name" : fullName + lastName ,
                           "first_name":fullName,
                           "last_name": lastName,
                           "age":Agegroup,
                           "city": city,
                           "street_address":street,
                           "area":area,
                           "country":country,
                           "id_number" : specialID,
                           "selected_lang":Preferredlang,
                           "email": email,
                           "user_type" :  1,
                           "lat": self.viewOTP.getPin(),
                           "long": self.viewOTP.getPin() ,
                           "gender" : gender] as [String : Any]
        
        
        let url = WSRequest.CustomerRegister()
        
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
                        self.pushQuestionnaireFormVC(userid: "\(user_id ?? 0)")
                        
                    }
                }else{
                    Loaf("Something went wrong", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
                
            }
            
        }
        
    }
    
    func pushQuestionnaireFormVC(userid:String){
        guard let vc = UIStoryboard.Customer.instantiateViewController(withIdentifier: String(describing: QuestionnaireFormVC.self)) as? QuestionnaireFormVC else { return }
        vc.user_id = userid
        self.navigationController?.pushViewController(vc, animated: false)
    }
} //class


