//
//  ConsultantRegistrationTwoVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/05/21.
//

import UIKit
import Loaf
import SVProgressHUD

class CompanyRegistrationTwoVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext          : UIButton!
    @IBOutlet weak var vwLinkedInBack   : UIView!
    @IBOutlet weak var vwFacebookBack   : UIView!
    @IBOutlet weak var lblBusinessLicense   : UILabel!
    @IBOutlet weak var lblCorporateIndustry   : UILabel!
    @IBOutlet weak var lblCompanySummary   : UILabel!
    @IBOutlet weak var lblSite   : UILabel!
    @IBOutlet weak var lblSocialMediaPages   : UILabel!
    @IBOutlet weak var txtFldCompanyLicense   : UITextField!
    @IBOutlet weak var txtFldCompanyIndustry   : UITextField!
    @IBOutlet weak var txtFldcompanySummary   : UITextField!
    @IBOutlet weak var txtFldCompanySite   : UITextField!
    @IBOutlet weak var txtFldFacebookUrl   : UITextField!
    @IBOutlet weak var txtFldLinkedInUrl   : UITextField!
    
    
    // MARK:- Variables
    var company_name = ""
    var conatct_name = ""
    var company_staff = ""
    var email = ""
    var conatct_no = ""
    
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
        self.title = "Company Resgistration".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        vwLinkedInBack.setBorder(with: .app_MdiumTextColor, 0.8)
        vwFacebookBack.setBorder(with: .app_MdiumTextColor, 0.8)
        vwLinkedInBack.setShadow()
        vwFacebookBack.setShadow()
        self.navigationItem.leftBarButtonItem = backBtn
        
        lblBusinessLicense.text = "Business license for the company".localiz()
        lblCorporateIndustry.text = "Corporate Industry".localiz()
        lblCompanySummary.text = "Company Summary".localiz()
        lblSite.text = "Site".localiz()
        lblSocialMediaPages.text = "Social media pages".localiz()
    }
    
    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        //pushOTPVC()
        
        guard validationsCompany() else { return }
        wsRegisterCompany()
    }
    
    // MARK:- Push Methods
    private func pushOTPVC() {
        guard let vc = UIStoryboard.Customer.instantiateViewController(withIdentifier: String(describing: OTPVC.self)) as? OTPVC else { return }
        vc.isFromConsultantRegsitration = true
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    // MARK:- Custom Methods
    func validationsCompany()-> Bool {
        if (txtFldCompanyLicense.text ?? "").isEmpty {
            Loaf("Please enter Company License.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldCompanyIndustry.text ?? "").isEmpty {
            Loaf("Please enter corporate industry.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }

        
        if (txtFldcompanySummary.text ?? "").isEmpty {
            Loaf("Please enter company Summary.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldCompanySite.text ?? "").isEmpty {
            Loaf("Please enter company site.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldLinkedInUrl.text ?? "").isEmpty {
            Loaf("Please enter linkedIn Url.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldFacebookUrl.text ?? "").isEmpty {
            Loaf("Please enter facebook Url.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        return true
    }
    
    
    func wsRegisterCompany() {

        let parameters = [ "username" : "corporate_user",
                           "password" : "123456",
                           "company_name": self.company_name,
                           "conatct_name": self.conatct_name,
                           "company_staff" :  self.company_staff,
                           "email" : self.email,
                           "conatct_no" : self.conatct_no,
                           "company_license" : self.txtFldCompanyLicense.text ?? "",
                           "company_industry" : self.txtFldCompanyIndustry.text ?? "",
                           "company_summary" : self.txtFldcompanySummary.text ?? "",
                           "company_site" : self.txtFldCompanySite.text ?? "",
                           "facebook_url" : self.txtFldFacebookUrl.text ?? "",
                           "linkedIn_url" : self.txtFldLinkedInUrl.text ?? ""] as [String : Any]
    

        let url = WSRequest.CorporatRegisteration()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
              
                DispatchQueue.main.async {
                    Loaf("Company registered sucessfully..".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show(Loaf.Duration.short) { _ in
                        self.pushOTPVC()
                    }
                
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


