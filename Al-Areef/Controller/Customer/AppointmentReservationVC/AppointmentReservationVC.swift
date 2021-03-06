//
//  AppointmentReservationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/04/21.
//

import UIKit

class AppointmentReservationVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnMorningAppointment1          : UIButton!
    @IBOutlet weak var btnMorningAppointment2          : UIButton!
    @IBOutlet weak var btnMorningAppointment3          : UIButton!
    @IBOutlet weak var btnEveningAppointment1          : UIButton!
    @IBOutlet weak var btnEveningAppointment2          : UIButton!
    @IBOutlet weak var btnEveningAppointment3          : UIButton!
    @IBOutlet weak var btnNext                         : UIButton!
    @IBOutlet weak var lblUserName                     : UILabel!
    @IBOutlet weak var lblExperience                   : UILabel!
    @IBOutlet weak var lblMorningAppointment           : UILabel!
    @IBOutlet weak var lblEveningAppointment           : UILabel!
    @IBOutlet weak var lblDate                         : UILabel!
    @IBOutlet weak var vwMain           : UIView!
       
    
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
        self.title = "Reservation and appointment".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        setBtnMorningUI()
        setBtnEveningUI()
        btnMorningAppointment1.sendActions(for: .touchUpInside)
        btnEveningAppointment1.sendActions(for: .touchUpInside)
        lblDate.text = "Thursday 19 April 2021".localiz()
        lblUserName.text = "Dr. Anila Khaldoum".localiz()
        lblExperience.text = "12 " + "years of experience".localiz()
        lblMorningAppointment.text = "Morning Appointment".localiz()
        lblEveningAppointment.text = "Evening Appointment".localiz()
        btnNext.setTitle("Next".localiz(), for: .normal)
        
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            vwMain.semanticContentAttribute = .forceRightToLeft
        }else
        {
            vwMain.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    func setBtnMorningUI(){
        btnMorningAppointment1.setCornerRadius(radius: 5)
        btnMorningAppointment2.setCornerRadius(radius: 5)
        btnMorningAppointment3.setCornerRadius(radius: 5)
        btnMorningAppointment1.setBorder(with: .app_Green, 1)
        btnMorningAppointment2.setBorder(with: .app_Green, 1)
        btnMorningAppointment3.setBorder(with: .app_Green, 1)
        btnMorningAppointment1.setTitleColor(.app_Green, for: .normal)
        btnMorningAppointment2.setTitleColor(.app_Green, for: .normal)
        btnMorningAppointment3.setTitleColor(.app_Green, for: .normal)
        btnMorningAppointment1.backgroundColor = .clear
        btnMorningAppointment2.backgroundColor = .clear
        btnMorningAppointment3.backgroundColor = .clear
    }
    
    func setBtnEveningUI(){
        btnEveningAppointment1.setCornerRadius(radius: 5)
        btnEveningAppointment2.setCornerRadius(radius: 5)
        btnEveningAppointment3.setCornerRadius(radius: 5)
        btnEveningAppointment1.setBorder(with: .app_Green, 1)
        btnEveningAppointment2.setBorder(with: .app_Green, 1)
        btnEveningAppointment3.setBorder(with: .app_Green, 1)
        btnEveningAppointment1.setTitleColor(.app_Green, for: .normal)
        btnEveningAppointment2.setTitleColor(.app_Green, for: .normal)
        btnEveningAppointment3.setTitleColor(.app_Green, for: .normal)
        
        btnEveningAppointment1.backgroundColor = .clear
        btnEveningAppointment2.backgroundColor = .clear
        btnEveningAppointment3.backgroundColor = .clear
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMorningPressed(_ sender : UIButton){
        self.setBtnMorningUI()
        sender.backgroundColor = .app_Green
        sender.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func btnEveningPressed(_ sender : UIButton){
        self.setBtnEveningUI()
        sender.backgroundColor = .app_Green
        sender.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func btnNextPressed(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
//        for controller in self.navigationController!.viewControllers as Array {
//            if controller.isKind(of: ConsultingTypeVC.self) {
//                self.navigationController?.popToViewController(controller, animated: true)
//                break
//            }
//        }
    }
    
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
//        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
//        vc.consultType = consultType
//        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("????????????????????????? Receive Memory Warning on \(self) ?????????????????????????")
    }
    
    // MARK:-
    deinit {
        debugPrint("???? Controller is removed from memory \(self) ???? ????")
    }
    
    
} //class


