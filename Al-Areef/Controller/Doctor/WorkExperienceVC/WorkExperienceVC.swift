//
//  WorkExperienceVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit

class WorkExperienceVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext                          : UIButton!
    @IBOutlet weak var vwCurrentJobDescription          : UIView!
    @IBOutlet weak var vwPreviousJobDescription         : UIView!
    
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
        self.title = "Work Experience"
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.vwCurrentJobDescription.setBorder(with: .lightGray, 0.8)
        self.vwPreviousJobDescription.setBorder(with: .lightGray, 0.8)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        pushConsultantProfileVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultantProfileVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: ConsultantProfileVC.self)) as? ConsultantProfileVC else { return }
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


