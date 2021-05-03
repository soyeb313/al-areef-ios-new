//
//  SignUpVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var btnSignUpCustomer          : UIButton!
    @IBOutlet weak var btnSignUpDoctor            : UIButton!
    @IBOutlet weak var btnSignUpCompany           : UIButton!
    @IBOutlet weak var lblLoginInfo             : UILabel!
    
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
        btnSignUpCustomer.backgroundColor = .app_DarkGray
        btnSignUpDoctor.setBorder(with: .app_Green, 1)
        btnSignUpCompany.setBorder(with: .app_Green, 1)
        lblLoginInfo.halfTextColorChange(fullText: "Already have an account? Log in".localiz(), changeText: "Log in", fontColor: .app_Green)
        lblLoginInfo.isUserInteractionEnabled = true
        lblLoginInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
        self.btnSignUpDoctor.setTitle("Sign up for doctor".localiz(), for: .normal)
        self.btnSignUpCompany.setTitle("Sign up for company".localiz(), for: .normal)
        
        self.btnSignUpCustomer.setTitle("Sign up for Customer".localiz(), for: .normal)
    }
    
    @IBAction func btnSignUpCustomerTapped(_ sender : UIButton){
        pushCustomerRegistrationVC()
    }
    
    @IBAction func btnSignUpDoctorTapped(_ sender : UIButton){
        pushRegistrationStepOneVC()
    }
    
    @IBAction func btnSignUpCompanyTapped(_ sender : UIButton){
        pushCompanyRegistrationVC()
    }
    
    // MARK:- Button Actions
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let text = lblLoginInfo.attributedText?.string else {
            return
        }
        
       // if let range = text.range(of: "Log in"),
        ///   recognizer.didTapAttributedTextInLabel(label: lblLoginInfo, inRange: NSRange(range, in: text)) {
            pushLoginVC()
       // }
    }
    
    // MARK:- Push Methods
    private func pushCompanyRegistrationVC() {
        guard let vc = UIStoryboard.Company.instantiateViewController(withIdentifier: String(describing: CompanyRegistrationOneVC.self)) as? CompanyRegistrationOneVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    private func pushLoginVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LonginVC.self)) as? LonginVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    private func pushCustomerRegistrationVC() {
        guard let vc = UIStoryboard.Customer.instantiateViewController(withIdentifier: String(describing: CustomerRegistrationVC.self)) as? CustomerRegistrationVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    private func pushRegistrationStepOneVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: RegistrationStepOneVC.self)) as? RegistrationStepOneVC else { return }
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


