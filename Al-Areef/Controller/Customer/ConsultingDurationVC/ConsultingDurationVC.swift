//
//  ConsultingDurationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingDurationVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext          : UIButton!
    @IBOutlet weak var lbldoller: UILabel!
    @IBOutlet weak var vwBack           : UIView!
    @IBOutlet weak var vwDurationBack1  : UIView!
    @IBOutlet weak var vwDurationBack2  : UIView!
    @IBOutlet weak var vwDurationBack3  : UIView!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblDescription   : UILabel!
    // MARK:- Variables
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblMin3: UILabel!
    
    @IBOutlet weak var lblPrice2: UILabel!
    @IBOutlet weak var lbmin2: UILabel!
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Choose Duration".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack1.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack2.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack3.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
//        btnNext.setCornerRadius(radius: 4)
        self.btnNext.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblDescription.text = "Please specify how long you want to book the appointment".localiz()
        lbldoller.text = "10 USD".localiz()
        lblPrice.text =  "20 USD".localiz()
        lblPrice2.text  = "30 USD".localiz()
        lblMin.text = "10 Minutes".localiz()
        lblMin3.text = "30 Minutes".localiz()
        lbmin2.text  = "20 Minutes".localiz()
        btnNext.setTitle("NEXT".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        pushChooseDurationVC()
    }
    
    // MARK:- Push Methods
    private func pushChooseDurationVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
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
