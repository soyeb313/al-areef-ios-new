//
//  ConsultantProfileVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit

class ConsultantProfileVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext                : UIButton!
    @IBOutlet weak var btnUpload              : UIButton!
    @IBOutlet weak var vwDescription          : UIView!
    
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
        self.title = "Consultant's Profile"
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.vwDescription.setBorder(with: .lightGray, 0.8)
        self.btnUpload.setCornerRadius(radius: 5)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        pushLoginVC()
    }
    
    // MARK:- Push Methods
    private func pushLoginVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LoginStepOneVC.self)) as? LoginStepOneVC else { return }
        self.navigationController?.setViewControllers([vc], animated: true)
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


