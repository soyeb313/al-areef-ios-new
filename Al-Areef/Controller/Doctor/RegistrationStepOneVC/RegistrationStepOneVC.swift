//
//  RegistrationStepOneVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit

class RegistrationStepOneVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnRegisterNow          : UIButton!
    @IBOutlet weak var txtName          : UITextField!
  
  
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
       
    }
    
    // MARK:- Button Actions
    @IBAction func btnRegisterNowTapped(_ sender : UIButton){
        pushLInfoSliderVC()
    }
    
    // MARK:- Push Methods
    private func pushLInfoSliderVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: InfoSliderVC.self)) as? InfoSliderVC else { return }
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


