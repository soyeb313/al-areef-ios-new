//
//  WorkExperienceVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit
import Loaf
import Photos
import AssetsLibrary
import Alamofire
import Loaf
import SVProgressHUD




class WorkExperienceVC: UIViewController {

    @IBOutlet weak var txtPrviouseDescription: UITextView!
    @IBOutlet weak var txtPreviouseJobTitle: UITextField!
    @IBOutlet weak var txtPrivouseTenure: UITextField!
    @IBOutlet weak var txtprviouseEmployer: UITextField!
    @IBOutlet weak var txtTenure: UITextField!
    // MARK:- Outlets
    @IBOutlet weak var txtViewCureentDescription: UITextView!
    @IBOutlet weak var txtCurrentEmployer: UITextField!
    @IBOutlet weak var txtCurrentJobTitle: UITextField!
    @IBOutlet weak var btnNext                          : UIButton!
    @IBOutlet weak var vwCurrentJobDescription          : UIView!
    @IBOutlet weak var vwPreviousJobDescription         : UIView!
    
    @IBOutlet weak var lblListWorkExperience            : UILabel!
    @IBOutlet weak var lblCurrentPositionHeld           : UILabel!
    @IBOutlet weak var lblJobTitle                      : UILabel!
    @IBOutlet weak var lblNameofEmployer                : UILabel!
    @IBOutlet weak var lblTenure                        : UILabel!
    @IBOutlet weak var lblBriefJobDescription           : UILabel!
    @IBOutlet weak var lblPreviousPositionsHeld         : UILabel!
    @IBOutlet weak var lblPreviousNameofEmployer        : UILabel!
    @IBOutlet weak var lblPreviousTenure                : UILabel!
    @IBOutlet weak var lblPreviousJobTitle              : UILabel!
    @IBOutlet weak var lblPreviousBriefJobDescription   : UILabel!
    
    var  userid = ""
    
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
        self.title = "Work Experience".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.vwCurrentJobDescription.setBorder(with: .lightGray, 0.8)
        self.vwPreviousJobDescription.setBorder(with: .lightGray, 0.8)
        
        lblListWorkExperience.text = "List Work Experience".localiz()
        lblCurrentPositionHeld.text = "Current Position Held".localiz()
        lblJobTitle.text = "Job Title".localiz()
        lblNameofEmployer.text = "Name of Employer".localiz()
        lblTenure.text = "Tenure".localiz()
        lblBriefJobDescription.text = "Brief Job Description".localiz()
        lblPreviousPositionsHeld.text = "Previous Positions Held".localiz()
        lblPreviousNameofEmployer.text = "Name of Employer".localiz()
        lblPreviousTenure.text = "Tenure".localiz()
        lblPreviousJobTitle.text = "Job Title".localiz()
        lblPreviousBriefJobDescription.text = "Brief Job Description".localiz()
        
        btnNext.setTitle("Next".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){

    if self.txtCurrentEmployer.text  == "" {
        Loaf("Please enter cureent job title.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else   if self.txtCurrentEmployer.text  == ""
    {
        Loaf("Please enter your current employer.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else   if self.txtTenure.text  == ""
    {
        Loaf("Please enter current tenure".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
    }else
    if self.txtViewCureentDescription.text  == ""
   {
       Loaf("Please enter job desciption in brif.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
   }else if self.txtPreviouseJobTitle.text  == "" {
    Loaf("Please enter your previous job title.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
}else   if self.txtprviouseEmployer.text  == ""
{
    Loaf("Please enter your previous employer name.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
}else   if self.txtPrivouseTenure.text  == ""
{
    Loaf("Please enter your previous job tenure.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
}else   if self.txtPrviouseDescription.text  == ""
{
    Loaf("Please enter previous job desciption in brif.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
}else{
        SVProgressHUD.show()
        wsWorkExperince1()
    
       }
        
}
        func wsWorkExperince1() {
           
            let parameters = [ "job_title":txtCurrentJobTitle.text ?? "",
                              "employer_name": txtCurrentEmployer.text ?? "",
                              "tenure" :  txtTenure.text ?? "",
                              "job_description": txtViewCureentDescription.text ?? "",
                              "user_id" : userid,
                              "type" : 1  ] as [String : Any]
        

            let url = WSRequest.ConsultantAddWorkExp()
            
            WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
                print(responseDict,err)
                if let result = responseDict["message"] as? String
                {
                    
                    let message = "\(String(describing:result))"
                    print(message)
                  
                    DispatchQueue.main.async {
                        if result == "success"
                        {
                            self.wsWorkExperince2()
                          
                        }
                       

                   
                    }
                }
               
            }

        }
    func wsWorkExperince2() {
       
        let parameters = [ "job_title":txtPreviouseJobTitle.text ?? "",
                          "employer_name": txtprviouseEmployer.text ?? "",
                          "tenure" :  txtPrivouseTenure.text ?? "",
                          "job_description": txtPrviouseDescription.text ?? "",
                          "user_id" : userid,
                          "type" : 2  ] as [String : Any]
    

        let url = WSRequest.ConsultantAddWorkExp()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
              
                DispatchQueue.main.async {
                    if result == "success"
                    {
                        self.pushConsultantProfileVC()
                        Loaf("Work experience Details updated sucessfully. Please Describe your self.", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                    }
                }
            }
           
        }

    }
    // MARK:- Push Methods
    private func pushConsultantProfileVC() {
        
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: ConsultantProfileVC.self)) as? ConsultantProfileVC else { return }
        vc.userID = userid
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


