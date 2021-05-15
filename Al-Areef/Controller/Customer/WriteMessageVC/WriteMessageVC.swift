//
//  WriteMessageVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 27/04/21.
//

import UIKit

class WriteMessageVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var txtVwMessage          : PlaceholderTextView!
    @IBOutlet weak var btnAddWords           : UIButton!
    @IBOutlet weak var btnNext           : UIButton!
    @IBOutlet weak var lblWords1: UILabel!
    @IBOutlet weak var lblWords2: UILabel!
    @IBOutlet weak var lblPrice1: UILabel!
    @IBOutlet weak var lblPrice2: UILabel!
    @IBOutlet weak var vwPrice1: UIView!
    @IBOutlet weak var vwPrice2: UIView!
    @IBOutlet weak var iconPrice1   : UIImageView!
    @IBOutlet weak var iconPrice2   : UIImageView!
    
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
        self.title = "Write your message".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
        self.navigationItem.rightBarButtonItem = searchbtn
        
        lblWords1.text = "200 words".localiz()
        lblWords2.text = "500 words".localiz()
        lblPrice1.text = "30 dollars".localiz()
        lblPrice2.text = "60 dollars".localiz()
        btnAddWords.setTitle("+ Add words".localiz(), for: .normal)
        btnNext.setTitle("Next".localiz(), for: .normal)
        self.vwPrice1.isHidden = true
        self.vwPrice2.isHidden = true
        txtVwMessage.placeholder = "Write your message".localiz()
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func btnSearchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextPressed(_ sender : UIButton){
        pushMakePaymentVC()
    }
    
    @IBAction func btnAddWords(_ sender : UIButton){
        self.vwPrice1.isHidden = false
        self.vwPrice2.isHidden = false
    }
    
    @IBAction func btnSelectOptionTapped(_ sender : UIButton){
        resetOtpIcon()
        switch sender.tag {
        case 1:
            self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        default :
            self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        
        }
    }
    
    func resetOtpIcon(){
        self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        
    }
    
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
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


