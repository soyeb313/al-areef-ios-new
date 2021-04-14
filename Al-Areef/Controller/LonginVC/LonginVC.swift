//
//  LonginVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

class LonginVC: UIViewController {

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
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        
        viewBackUserID.setBorder(with: .app_Green, 1)
        viewBackPassword.setBorder(with: .app_Green, 1)
        lblSignUpInfo.halfTextColorChange(fullText: "If you don't have an account? Sign Up", changeText: "Sign Up", fontColor: .app_Green)
        lblSignUpInfo.isUserInteractionEnabled = true
        lblSignUpInfo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK:- Button Actions
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let text = lblSignUpInfo.attributedText?.string else {
            return
        }

        if let range = text.range(of: "Sign Up"),
            recognizer.didTapAttributedTextInLabel(label: lblSignUpInfo, inRange: NSRange(range, in: text)) {
            pushSignUpVC()
        }
    }
    
    // MARK:- Push Methods
    private func pushSignUpVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: SignUpVC.self)) as? SignUpVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
        self.navigationController?.pushViewController(vc, animated: true)

        
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


