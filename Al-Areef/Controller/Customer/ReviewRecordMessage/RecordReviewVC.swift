//
//  RecordReviewVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 27/04/21.
//

import UIKit

class RecordReviewVC: UIViewController {
    @IBOutlet weak var lblConsultantResponded: UILabel!
    
    @IBOutlet weak var viewReboot: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var lblAdviseInfo: UILabel!
    @IBOutlet weak var lblReboot: UILabel!
    @IBOutlet weak var lblYourVoice: UILabel!
    @IBOutlet weak var lblConsultantName: UILabel!
    @IBOutlet weak var lblConsultantRole: UILabel!
    @IBOutlet weak var lblFamilyrelations: UILabel!
    @IBOutlet weak var lblCounslingSubject: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        viewTwo.layer.shadowColor = UIColor.darkGray.cgColor
        viewTwo.layer.shadowOpacity = 1
        viewTwo.layer.shadowOffset = .zero
        viewTwo.layer.shadowRadius = 10
        
        viewReboot.layer.shadowColor = UIColor.darkGray.cgColor
        viewReboot.layer.shadowOpacity = 1
        viewReboot.layer.shadowOffset = .zero
        viewReboot.layer.shadowRadius = 10
        setUpView()
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Consultation details".localiz()
       
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnReboot(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ConsultingTypeVC.self) {
                self.navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
