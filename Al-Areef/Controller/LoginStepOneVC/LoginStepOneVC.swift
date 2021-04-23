//
//  LoginStepOneVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

class LoginStepOneVC: UIViewController {
    var switchLanguage = LanguageDetails()
    // MARK:- Outlets
    @IBOutlet weak var btnLoginCustomer          : UIButton!
    @IBOutlet weak var btnLoginDoctor            : UIButton!
    @IBOutlet weak var btnLoginVisitor           : UIButton!
    @IBOutlet weak var lblSignUpInfo             : UILabel!
    
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
        
        btnLoginCustomer.backgroundColor = .app_DarkGray
        btnLoginDoctor.setBorder(with: .app_Green, 1)
        btnLoginVisitor.setBorder(with: .app_Green, 1)
        lblSignUpInfo.halfTextColorChange(fullText: switchLanguage.LocalString(key: "If you don't have an account? Sign Up".localiz()), changeText:"Sign Up",  fontColor: .app_Green)
       
        lblSignUpInfo.isUserInteractionEnabled = true
        lblSignUpInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
        btnLoginCustomer.setTitle("Log in as customer".localiz(), for: .normal)
        btnLoginVisitor.setTitle("Log in as doctor".localiz(), for: .normal)
        btnLoginDoctor.setTitle("Continue as visitor".localiz(), for: .normal)
    }
    
    @IBAction func btnLoginCustomerTapped(_ sender : UIButton){
        pushLoginVC()
    }
    
    // MARK:- Button Actions
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let text = lblSignUpInfo.attributedText?.string else {
            return
        }

       // if let range = text.range(of: "Sign Up"),
          //  recognizer.didTapAttributedTextInLabel(label: lblSignUpInfo, inRange: NSRange(range, in: text)) {
            pushSignUpVC()
        
    }
    
    // MARK:- Push Methods
    private func pushLoginVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LonginVC.self)) as? LonginVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    private func pushSignUpVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: SignUpVC.self)) as? SignUpVC else { return }
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


