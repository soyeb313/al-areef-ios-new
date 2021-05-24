//
//  ChooseDurationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ChooseDurationVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
   
    // MARK:- Variables
    var consultType : ConsultingType?
    var navFlag = ""
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
        self.title = "Choose Duration".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
//        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
//        self.navigationItem.rightBarButtonItem = searchbtn
        
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 35
        self.tableView.sectionFooterHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionFooterHeight = 35
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func btnSearchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBookAppointmentPressed(_ sender : UIButton){
        pushMakePaymentVC()
    }
    
    @IBAction func btnpaymentPressed(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnCalenderPressed(_ sender : UIButton){
        if sender.tag == 0 {
            if consultType?.rawValue == "Voice message" ||  consultType?.rawValue == "Text message"
            {
                guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
                vc.consultType = consultType
                self.navigationController?.pushViewController(vc, animated: false)
            }else{
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CalendarVC.self)) as? CalendarVC else { return }
            vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: TimelineVC.self)) as? TimelineVC else { return }
        
        self.navigationController?.pushViewController(vc, animated: false)
//        switch consultType {
//        case .TextMessage:
//            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: WriteMessageVC.self)) as? WriteMessageVC else { return }
//            self.navigationController?.pushViewController(vc, animated: false)
//        case .VoiceMessage :
//
//            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: TimelineVC.self)) as? TimelineVC else { return }
//
//            self.navigationController?.pushViewController(vc, animated: false)
//        default:
//            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentReservationVC.self)) as? AppointmentReservationVC else { return }
//            self.navigationController?.pushViewController(vc, animated: false)
//        }
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
extension ChooseDurationVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 4
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch consultType {
        case .AudioConnections,.ConsultantRegistration,.PersonalMeeting:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChooseDurationCell.self), for: indexPath) as? ChooseDurationCell else{ return UITableViewCell() }
        cell.btnSelectProfile.tag = indexPath.section
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            switch consultType {
            case .VoiceMessage,.TextMessage : return UITableView.automaticDimension
            default : return CGFloat.leastNonzeroMagnitude
            }
            
        }else{
            return CGFloat.leastNonzeroMagnitude
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            switch consultType {
            case .VoiceMessage,.TextMessage :
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseDurationHeaderCell") as? ChooseDurationHeaderCell else{ return UITableViewCell() }
                return cell.contentView
            default :return  UIView()
            }
        }else{
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }else{
            return CGFloat.leastNonzeroMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseDurationFooterCell") as? ChooseDurationFooterCell else{ return UITableViewCell() }
            cell.btnMore.setTitle("More consultants".localiz(), for: .normal)
            return cell.contentView
        }else{
            return UIView()
        }
        
    }
    
}

