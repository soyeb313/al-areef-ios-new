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
    @IBOutlet weak var btnAddWords      : UIButton!
    @IBOutlet weak var lblPrice1: UILabel!
    @IBOutlet weak var vwBack           : UIView!
    @IBOutlet weak var vwDurationBack1  : UIView!
    @IBOutlet weak var vwDurationBack2  : UIView!
    @IBOutlet weak var vwDurationBack3  : UIView!
    @IBOutlet weak var vwAddWords       : UIView!
    @IBOutlet weak var lblMin1: UILabel!
    @IBOutlet weak var lblDescription   : UILabel!
    @IBOutlet weak var lblPrice3: UILabel!
    @IBOutlet weak var lblMin3: UILabel!
    @IBOutlet weak var lblPrice2: UILabel!
    @IBOutlet weak var lbmin2: UILabel!
    @IBOutlet weak var icon1   : UIImageView!
    @IBOutlet weak var icon2   : UIImageView!
    @IBOutlet weak var icon3   : UIImageView!
    @IBOutlet weak var iconPrice1   : UIImageView!
    @IBOutlet weak var iconPrice2   : UIImageView!
    @IBOutlet weak var iconPrice3   : UIImageView!
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Choose Duration".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
        self.navigationItem.rightBarButtonItem = searchbtn
        
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack1.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack2.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack3.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
//        btnNext.setCornerRadius(radius: 4)
        self.btnNext.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblDescription.text = "Please specify how long you want to book the appointment".localiz()
        btnAddWords.setTitle("+ Add words".localiz(), for: .normal)
        vwDurationBack1.semanticContentAttribute = .forceLeftToRight
        vwDurationBack2.semanticContentAttribute = .forceLeftToRight
        vwDurationBack3.semanticContentAttribute = .forceLeftToRight
        
        if consultType == ConsultingType.TextMessage {
            self.vwAddWords.isHidden = false
            lblPrice1.text = "100 dollars".localiz()
            lblPrice2.text =  "30 dollars".localiz()
            lblPrice3.text  = "60 dollars".localiz()
            lblMin1.text = "1000 words".localiz()
            lblMin3.text = "200 words".localiz()
            lbmin2.text  = "500 words".localiz()
            self.vwDurationBack2.isHidden = true
            self.vwDurationBack3.isHidden = true
            self.icon1.image = #imageLiteral(resourceName: "keyboardGreen")
            self.icon2.image = #imageLiteral(resourceName: "keyboardGreen")
            self.icon3.image = #imageLiteral(resourceName: "keyboardGreen")
        }else{
            self.vwAddWords.isHidden = true
            lblPrice1.text = "10 USD".localiz()
            lblPrice2.text =  "20 USD".localiz()
            lblPrice3.text  = "30 USD".localiz()
            lblMin1.text = "10 Minutes".localiz()
            lblMin3.text = "30 Minutes".localiz()
            lbmin2.text  = "20 Minutes".localiz()
            self.vwDurationBack2.isHidden = false
            self.vwDurationBack3.isHidden = false
        }
        
        btnNext.setTitle("NEXT".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func btnSearchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        pushChooseDurationVC()
    }
    
    @IBAction func btnSelectOptionTapped(_ sender : UIButton){
        resetOtpIcon()
        switch sender.tag {
        case 1:
            self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        case 2:
            self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        default:
            self.iconPrice3.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        }
    }
    
    func resetOtpIcon(){
        self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        self.iconPrice3.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
    }
    
    @IBAction func btnAddWordsTapped(_ sender : UIButton){
        self.vwDurationBack2.isHidden = false
        self.vwDurationBack3.isHidden = false
    }
    
    // MARK:- Push Methods
    private func pushChooseDurationVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
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
