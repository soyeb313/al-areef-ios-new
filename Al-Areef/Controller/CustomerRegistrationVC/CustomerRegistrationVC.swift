//
//  CustomerRegistrationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit
import Loaf
import SVProgressHUD
class CustomerRegistrationVC: UIViewController {

    @IBOutlet weak var txtPasword: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPhoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var txtUserId: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtSpecialIdNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var txtGender: SkyFloatingLabelTextField!
    @IBOutlet weak var txtFullName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtStreet: SkyFloatingLabelTextField!
    @IBOutlet weak var txtArea: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCountry: SkyFloatingLabelTextField!
    @IBOutlet weak var txtCityTown: SkyFloatingLabelTextField!
    @IBOutlet weak var txtSelectLanguage: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnComplete: UIButton!
    
    @IBOutlet weak var vwName: UIView!
    @IBOutlet weak var vwGender: UIView!
    @IBOutlet weak var vwIdNumber: UIView!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var vwCity: UIView!
    @IBOutlet weak var vwPhoneNumber: UIView!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var lblRegistration: UILabel!
    
    @IBOutlet weak var vwStreet: UIView!
    @IBOutlet weak var vwArea: UIView!
    @IBOutlet weak var vwCountry: UIView!
    @IBOutlet weak var vwCityTown: UIView!
    @IBOutlet weak var vwSelectLanguage: UIView!
    
 
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSelectLanguage: UILabel!
    
    
    // MARK:- Outlets
    var OTP = "12345"
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.hideKeyboardWhenTappedAround()
        
        vwName.setBorder(with: .app_Green, 1)
        vwGender.setBorder(with: .app_Green, 1)
        vwIdNumber.setBorder(with: .app_Green, 1)
        vwEmail.setBorder(with: .app_Green, 1)
        vwCity.setBorder(with: .app_Green, 1)
        vwPhoneNumber.setBorder(with: .app_Green, 1)
        vwPassword.setBorder(with: .app_Green, 1)
        vwStreet.setBorder(with: .app_Green, 1)
        vwArea.setBorder(with: .app_Green, 1)
        vwCountry.setBorder(with: .app_Green, 1)
        vwCityTown.setBorder(with: .app_Green, 1)
        vwSelectLanguage.setBorder(with: .app_Green, 1)
        
        
        txtStreet.placeholder = "Street".localiz()
        txtArea.placeholder = "Area".localiz()
        txtCountry.placeholder = "Country".localiz()
        txtCityTown.placeholder = "City Town".localiz()
        txtSelectLanguage.placeholder = "Select Language".localiz()
        
        txtPasword.placeholder = "Password".localiz()
        txtPhoneNumber.placeholder = "Your phone number".localiz()
        txtUserId.placeholder = "City".localiz()
        txtEmail.placeholder = "Your email address".localiz()
        txtSpecialIdNumber.placeholder = "Special ID number".localiz()
        txtGender.placeholder = "Your Gender".localiz()
        txtFullName.placeholder = "Fat-full".localiz()
        lblRegistration.text = "Registration".localiz()
        
        lblAddress.text = "Address".localiz()
        lblSelectLanguage.text = "Preferred Language".localiz()
        btnComplete.setTitle("Completes".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCompeteRegisterationTapped(_ sender : UIButton){
        self.pushOTPVC()
        /*
        
        if self.txtFullName.text  == "" {
            Loaf("Please enter full name.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtGender.text  == ""
        {
            Loaf("Please enter your  gender.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtSpecialIdNumber.text  == ""
        {
            Loaf("Please enter your  speacial ID number.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtEmail.text  == ""
        {
            Loaf("Please enter your Email id.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  isValidEmail(testStr:txtEmail.text ?? "") == false
        {
            Loaf("Please enter valid Email id.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  txtUserId.text == ""
        {
            Loaf("Please enter User ID.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  txtPhoneNumber.text == ""
        {
            Loaf("Please enter your phone number.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  txtPasword.text == ""
        {
            Loaf("Please enter password.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else
        {
            SVProgressHUD.show()
            wsSendOtp()
           
        }*/
        
    }
    func wsSendOtp() {
       
        
        let parameters = [ "user_type": 1,
                          "mobile_number": txtPhoneNumber.text ?? "",
                          "user_id" :  1 ] as [String : Any]
    

        let url = WSRequest.SendOtp()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
                self.OTP = "\( responseDict["Otp"] as? Int ?? 0)"
                DispatchQueue.main.async {
                    self.pushOTPVC()
                    Loaf("OTP sent sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()

               
                }
            }
           
        }

    }
    func isValidEmail(testStr:String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: testStr)
   }
    // MARK:- Push Methods
    private func pushOTPVC() {
        guard let vc = UIStoryboard.Customer.instantiateViewController(withIdentifier: String(describing: OTPVC.self)) as? OTPVC else { return }
        vc.fullName = self.txtFullName.text ?? ""
        vc.email = self.txtEmail.text ?? ""
        vc.gender = self.txtGender.text ?? ""
        vc.userID = self.txtUserId.text ?? ""
        vc.specialID = self.txtSpecialIdNumber.text ?? ""
        vc.phonenumber = self.txtPhoneNumber.text ?? ""
        vc.otp = OTP
        vc.password = self.txtPasword.text ?? ""
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
    
} //class


