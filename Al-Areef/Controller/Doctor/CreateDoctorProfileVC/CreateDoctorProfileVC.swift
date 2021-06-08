//
//  CreateDoctorProfileVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit
import Loaf
import SVProgressHUD
import DropDown

class CreateDoctorProfileVC: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    // MARK:- Outlets
    
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnCreateProfile          : UIButton!
    @IBOutlet weak var txtxName: UITextField!
    var userId = ""
    @IBOutlet weak var txtMobileNo: UITextField!
    
    @IBOutlet weak var lblEnterName: UILabel!
    @IBOutlet weak var lblEnterMobileNo: UILabel!
    @IBOutlet weak var lblEnterEmail: UILabel!
    @IBOutlet weak var lblEnterGender: UILabel!
    @IBOutlet weak var lblEnterPassword: UILabel!
    
    // MARK:- Variables
   
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        
        self.title = "Create Your Profile".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        btnCreateProfile.setTitle("Create your Profile".localiz(), for: .normal)
        self.navigationItem.leftBarButtonItem = backBtn
        
        lblEnterName.text = "Enter your Name".localiz()
        lblEnterMobileNo.text = "Mobile Number".localiz()
        lblEnterEmail.text = "Email Address".localiz()
        lblEnterGender.text = "Gender".localiz()
        lblEnterPassword.text = "Password".localiz()
        
        txtGender.delegate = self
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnCreateProfileTapped(_ sender : UIButton){
   //     self.pushAcademicQualificationVC()
        if self.txtxName.text  == "" {
            Loaf("Please enter full name.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtMobileNo.text  == ""
        {
            Loaf("Please enter your  mobile number.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtEmail.text  == ""
        {
            Loaf("Please enter your Email id.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  isValidEmail(testStr:txtEmail.text ?? "") == false
        {
            Loaf("Please enter valid Email id.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  txtGender.text == ""
        {
            Loaf("Please enter your gender.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if  txtPassword.text == ""
        {
            Loaf("Please enter password.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else
        {
            SVProgressHUD.show()
           wsStep1Regster()
           
        }
    }
    
    func wsStep1Regster() {
       
        
        let parameters = [ "user_type": 2,
                          "mobile_number": txtMobileNo.text ?? "",
                          "username" :  "Af1" ,
                          "full_name" : txtxName.text ?? "",
                          "gender":txtGender.text ?? "",
                          "email":txtEmail.text ?? "",
                          "city":"Pune",
                          "lat":"18.234",
                          "long":"73.234",
                          "password": txtPassword.text ?? ""]  as [String : Any]
    let url = WSRequest.ConsultantRegisterStep1()
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
                        self.userId =  "\(user_id ?? 0)"
                    self.pushAcademicQualificationVC()
                    Loaf("Success.. Please fill academic details", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                }
            }else{
                Loaf(responseDict["message"] as? String ?? ""
                     , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
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
    private func pushAcademicQualificationVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: AcademicQualificationVC.self)) as? AcademicQualificationVC else { return }
        vc.userID = userId
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


extension CreateDoctorProfileVC : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.endEditing(true)
        let dropDown = DropDown()
        
        dropDown.anchorView = textField
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        let genderArr = ["Male".localiz(),"Female".localiz()]
        
        dropDown.dataSource = genderArr
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            textField.text = item
            
        }

        
        dropDown.show()
        
    }
}
