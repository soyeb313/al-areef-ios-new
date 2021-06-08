//
//  QuestionnaireFormVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 11/05/21.
//

import UIKit
import Loaf
import SVProgressHUD
import DropDown
class QuestionnaireFormVC: UIViewController {

   
    @IBOutlet weak var txtNoOfCompany: UITextField!
    @IBOutlet weak var txtExp_Year: UITextField!
    @IBOutlet weak var txtCurrentPosition: UITextField!
    @IBOutlet weak var txtQualification: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtType: UITextField!
    // MARK:- Outlets
    @IBOutlet weak var btnNext                      : UIButton!
    @IBOutlet weak var lblType                      : UILabel!
    @IBOutlet weak var lblAge                      : UILabel!
    @IBOutlet weak var lblCurrentPosition                      : UILabel!
    @IBOutlet weak var txtStatisFyJob: UITextField!
    @IBOutlet weak var txtLikeJob: UITextField!
    @IBOutlet weak var lblYearsofExperience                      : UILabel!
    @IBOutlet weak var lblQualification                      : UILabel!
    @IBOutlet weak var lblNumberOfCompaniesWorked                      : UILabel!
    @IBOutlet weak var lblLikeCurrentJob                      : UILabel!
    @IBOutlet weak var lblSatisfyCurrentJob                      : UILabel!
    @IBOutlet weak var lblSatisfyManagement                      : UILabel!
    @IBOutlet weak var lblHighestLevel1                      : UILabel!
    @IBOutlet weak var lblHighestLevel2                      : UILabel!
    @IBOutlet weak var lblLowestLevel1                      : UILabel!
    @IBOutlet weak var lblLowestLevel2                      : UILabel!
    var user_id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StepSlider2(_ sender: Any) {
        print((sender as AnyObject).tag ?? "")
    }
    @IBAction func StepSlider1(_ sender: Any) {
        print((sender as AnyObject).value ?? "")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Questions of professional success".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        btnNext.setTitle("Next".localiz(), for: .normal)
        lblType.text = "Type".localiz()
        lblAge.text = "Age".localiz()
        lblCurrentPosition.text = "Current Position".localiz()
        lblYearsofExperience.text = "Years of Experience".localiz()
        lblQualification.text = "Qualification".localiz()
        lblNumberOfCompaniesWorked.text = "The number of companies and places you worked in previously".localiz()
        lblLikeCurrentJob.text = "Do you like your current job or not?".localiz()
        
        lblSatisfyCurrentJob.text = "How satisfied are you with your job performance in the current job?".localiz()
        lblSatisfyManagement.text = "How satisfied are you with the management performance of your current company?".localiz()
        lblHighestLevel1.text = "The highest level of satisfaction".localiz()
        lblHighestLevel2.text = "The highest level of satisfaction".localiz()
        lblLowestLevel1.text = "The lowest level of satisfaction".localiz()
        lblLowestLevel2.text = "The lowest level of satisfaction".localiz()
        
        txtType.placeholder = "Type".localiz()
        txtAge.placeholder = "Age".localiz()
        txtCurrentPosition.placeholder = "Current Position".localiz()
        txtExp_Year.placeholder = "Years of Experience".localiz()
        txtQualification.placeholder = "Qualification".localiz()
        txtNoOfCompany.placeholder = "The number of companies and places you worked in previously".localiz()
        txtLikeJob.placeholder = "Do you like your current job or not?".localiz()
    }
    

    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        
        if self.txtType.text  == "" {
            Loaf("Please enter type.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else if self.txtAge.text  == "" {
            Loaf("Please enter age.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtCurrentPosition.text  == ""
        {
            Loaf("Please enter current position.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }
      else   if self.txtExp_Year.text  == ""
        {
           Loaf("Please enter experience".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
      }
        else   if self.txtQualification.text  == ""
        {
            Loaf("Please enter qualification.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        } else   if self.txtNoOfCompany.text  == ""
        {
            Loaf("Please enter no of company.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtLikeJob.text  == ""
        {
            Loaf("Please enter about your job".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else
        {
            SVProgressHUD.show()
            customerRegistrationStep2()
        }
        
        
    }
    
    // MARK:- Push Methods
    private func pushConsultantRegistrationTwoVC() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
        self.navigationController?.pushViewController(vc, animated: true)
        Loaf("You have register  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
    }
   
    
    func customerRegistrationStep2() {
        
        
        let parameters = [ "industry_type": txtType.text ?? "",
                           "age" : txtAge.text ?? "",
                           "current_position": txtCurrentPosition.text ?? "",
                           "experience_years" : txtExp_Year.text ?? "" ,
                           "qualification":txtQualification.text ?? "",
                           "number_of_company": txtNoOfCompany.text ?? "",
                           "job_like":txtLikeJob.text ?? "",
                           "job_satisfaction": 5,
                           "level_satisfaction":5,
                           "user_id":user_id
                           ] as [String : Any]
        
        
        let url = WSRequest.customerRegistrationStep2()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
           
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
                        
                        Loaf("You have register  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                        appDelegate.setDashBoard()
                        SVProgressHUD.dismiss()
                    }
                }else{
                    Loaf("Something went wrong", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
                
            }
            
        }
        
    }
}

