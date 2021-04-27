//
//  ConsultantDetailsVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 27/04/21.
//

import UIKit

class ConsultantDetailsVC: UIViewController {

    @IBOutlet weak var vwConsultantProfileBack: UIView!
    @IBOutlet weak var vwAppointmentDetailBack: UIView!
    @IBOutlet weak var vwRatingDetailBack: UIView!
    @IBOutlet weak var vwTextNoteBack: UIView!
    
    // MARK:- Variables
    var consultType : ConsultingType?
    
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
        self.title = "Consutation details".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        vwConsultantProfileBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwAppointmentDetailBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwRatingDetailBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwTextNoteBack.setCornerRadius(radius: 3)
        vwTextNoteBack.setBorder(with: .lightGray, 0.5)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextPressed(_ sender : UIButton){
        pushMakePaymentVC()
    }
    
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: MakePaymentVC.self)) as? MakePaymentVC else { return }
        vc.consultType = consultType
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


