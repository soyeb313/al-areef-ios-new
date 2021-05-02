//
//  OTPVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

class OTPVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var viewOTP          : OTPView!
    @IBOutlet weak var btnResent        : UIButton!
    var fullName = ""
    var gender = ""
    var email = ""
    var phonenumber  = ""
    var specialID = ""
    var userID = ""
    // MARK:- Variables
    var otp = ""
    
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
        self.viewOTP.setUpView(5, strPinValue: otp)
        self.btnResent.setCornerRadius(radius: 5)
        self.btnResent.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }
    
    // MARK:- Button Actions

    
    // MARK:- Push Methods

    
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


