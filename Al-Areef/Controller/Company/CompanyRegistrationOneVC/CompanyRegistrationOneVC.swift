//
//  ConsultantRegistrationOneVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/05/21.
//

import UIKit
import Loaf

class CompanyRegistrationOneVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext                      : UIButton!
    @IBOutlet weak var lblCompanyName               : UILabel!
    @IBOutlet weak var lblCompanyContactName        : UILabel!
    @IBOutlet weak var lblEmailAddress              : UILabel!
    @IBOutlet weak var lblPhoneNumber               : UILabel!
    @IBOutlet weak var lblNumberOfStaff             : UILabel!
    @IBOutlet weak var txtFldCompanyName            : UITextField!
    @IBOutlet weak var txtFldConatctName            : UITextField!
    @IBOutlet weak var txtFldEmail                  : UITextField!
    @IBOutlet weak var txtFldConatctNo              : UITextField!
    @IBOutlet weak var txtFldcompanyStaff           : UITextField!
    
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
        self.title = "Company Resgistration".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        lblCompanyName.text = "Company Name".localiz()
        lblCompanyContactName.text = "Company contact name".localiz()
        lblEmailAddress.text = "Email Address".localiz()
        lblPhoneNumber.text = "Phone number".localiz()
        lblNumberOfStaff.text = "Number of staff".localiz()
        btnNext.setTitle("Next".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        guard validationsCompany() else { return }
        pushConsultantRegistrationTwoVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultantRegistrationTwoVC() {
        guard let vc = UIStoryboard.Company.instantiateViewController(withIdentifier: String(describing: CompanyRegistrationTwoVC.self)) as? CompanyRegistrationTwoVC else { return }
        vc.company_name = self.txtFldCompanyName.text ?? ""
        vc.conatct_name = self.txtFldConatctName.text ?? ""
        vc.email = self.txtFldCompanyName.text ?? ""
        vc.conatct_no = self.txtFldConatctNo.text ?? ""
        vc.company_staff = self.txtFldcompanyStaff.text ?? ""
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    // MARK:- Custom Methods
    func validationsCompany()-> Bool {
        if (txtFldCompanyName.text ?? "").isEmpty {
            Loaf("Please enter company name.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldConatctName.text ?? "").isEmpty {
            Loaf("Please enter conatct Name.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if !(txtFldEmail.text?.isValidEmail ?? false) {
            Loaf("Please enter valid email.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if !(txtFldConatctNo.text?.isValidPhone ?? false) {
            Loaf("Please enter conatct No.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        if (txtFldcompanyStaff.text ?? "").isEmpty {
            Loaf("Please enter company staff.".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            return false
        }
        
        return true
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


