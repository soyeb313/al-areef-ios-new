//
//  RegistrationStepTwoVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit

class RegistrationStepTwoVC: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var vwLinkedIn          : UIView!
    @IBOutlet weak var vwFacebook          : UIView!
    @IBOutlet weak var vwEmail             : UIView!
    
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
        vwLinkedIn.setBorder(with: .app_Green, 1)
        vwFacebook.setBorder(with: .app_Green, 1)
        vwEmail.setBorder(with: .app_Green, 1)
    }
    
    // MARK:- Button Actions
    @IBAction func btnLinkedInTapped(_ sender : UIButton){
        pushCreateDoctorProfileVC()
    }
    
    @IBAction func btnFacebookTapped(_ sender : UIButton){
        pushCreateDoctorProfileVC()
    }
    
    @IBAction func btnMailTapped(_ sender : UIButton){
        pushCreateDoctorProfileVC()
    }
    
    // MARK:- Push Methods
    private func pushCreateDoctorProfileVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: CreateDoctorProfileVC.self)) as? CreateDoctorProfileVC else { return }
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


