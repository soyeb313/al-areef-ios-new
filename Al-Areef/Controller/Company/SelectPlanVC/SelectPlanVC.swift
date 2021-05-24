//
//  SelectPlanVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/05/21.
//

import UIKit

class SelectPlanVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnBuy          : UIButton!
    @IBOutlet weak var lblPlanDescription : UILabel!
    @IBOutlet weak var btnPlanOne : UIButton!
    @IBOutlet weak var btnPlanTwo : UIButton!
    @IBOutlet weak var btnPlanThree : UIButton!
    @IBOutlet weak var vwBackDescription : UIView!
    @IBOutlet weak var lblPlanFeature : UILabel!
    @IBOutlet weak var lblPlanCost : UILabel!
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setButtonUI()
        btnPlanOne.sendActions(for: .touchUpInside)
        vwBackDescription.setCornerRadius(radius: 20)
        vwBackDescription.setShadow()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Select Plan".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        btnBuy.setShadow()
        
        self.navigationItem.leftBarButtonItem = backBtn
        
        btnPlanOne.setTitle("PLAN A".localiz(), for: .normal)
        btnPlanTwo.setTitle("PLAN B".localiz(), for: .normal)
        btnPlanThree.setTitle("PLAN C".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnBuyTapped(_ sender : UIButton){
        pushMakePaymentVC()
    }
    
    @IBAction func btnPlanOneTapped(_ sender : UIButton){
        setButtonUI()
        setPlanOne()
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .app_Green
    }
    
    @IBAction func btnPlanTwoTapped(_ sender : UIButton){
        setButtonUI()
        setPlanTwo()
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .app_Green
    }
    
    @IBAction func btnPlanThreeTapped(_ sender : UIButton){
        setButtonUI()
        setPlanThree()
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .app_Green
    }
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
        vc.consultType = .ConsultantRegistration
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    // MARK:- Custom Methods
    func setButtonUI(){
        self.btnPlanOne.setCornerRadius(radius: self.btnPlanOne.frame.height / 2)
        self.btnPlanTwo.setCornerRadius(radius: self.btnPlanTwo.frame.height / 2)
        self.btnPlanThree.setCornerRadius(radius: self.btnPlanThree.frame.height / 2)
        
        self.btnPlanOne.setBorder(with: .app_Green, 1)
        self.btnPlanTwo.setBorder(with: .app_Green, 1)
        self.btnPlanThree.setBorder(with: .app_Green, 1)
        
        self.btnPlanOne.setTitleColor(.app_Green, for: .normal)
        self.btnPlanTwo.setTitleColor(.app_Green, for: .normal)
        self.btnPlanThree.setTitleColor(.app_Green, for: .normal)
        
        self.btnPlanOne.backgroundColor = .clear
        self.btnPlanTwo.backgroundColor = .clear
        self.btnPlanThree.backgroundColor = .clear
    }
    
    func setPlanOne(){
        self.lblPlanFeature.text = "Plan A Features".localiz() + ":"
        self.lblPlanCost.text = "KWD 1000"
        let planOne = ["Up to 10 registered employees.".localiz(), "Up to 3 sessions per employee.".localiz(), "Allowing the employee to continue taking sessions by paying on his own".localiz(), "Company Wallet".localiz(), "Employee use and spending reports.".localiz(),"Company coverage only includes advice and courses. All other expenses incurred by the employee".localiz()]
        
        self.lblPlanDescription.attributedText =  NSAttributedString().createListwithIcons(planOne, "paymentcheck", .left, 18, 18, -2)
        
        
    }
    
    func setPlanTwo(){
        self.lblPlanFeature.text = "Plan B Features".localiz() + ":"
        self.lblPlanCost.text = "KWD 3000"
        let planTwo = ["Register up to 50 employees".localiz(), "Access to the best advisors.".localiz(), "Up to 5 sessions per employee".localiz(), "Increase employee coverage limit".localiz(), "Allow the employee to continue taking sessions by paying on his own.".localiz(), "Company Wallet".localiz(), "Employee Wallet".localiz(), "Employee usage and spending reports.".localiz(),"Company coverage only includes advice and courses. All other expenses incurred by the employee".localiz()]
        
        self.lblPlanDescription.attributedText =  NSAttributedString().createListwithIcons(planTwo, "paymentcheck", .left, 18, 18, -2)
    }
    
    func setPlanThree(){
        self.lblPlanFeature.text = "Plan C Features".localiz() + ":"
        self.lblPlanCost.text = "KWD 5000"
        let planThree = ["Unlimited employee registration.".localiz(),"Access to the best consultants.".localiz(), "Priority courses for the VIP.".localiz(),"Unlimited sessions per employee.".localiz(),"Increase employee coverage limit".localiz(),"Allow the employee to continue taking sessions by paying on his own.".localiz(),"Employee to add family members".localiz(), "Company wallet".localiz(),"Employee's wallet".localiz(),"Employee usage and spending reports.".localiz(), "Company coverage only includes advice and courses. All other expenses to be beared by the employee".localiz()]
        
        self.lblPlanDescription.attributedText =  NSAttributedString().createListwithIcons(planThree, "paymentcheck", .left, 18, 18, -2)
    }
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
    
} //class


