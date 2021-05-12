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
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
        self.navigationItem.rightBarButtonItem = searchbtn
        
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
    
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        switch consultType {
        case .TextMessage:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: WriteMessageVC.self)) as? WriteMessageVC else { return }
            self.navigationController?.pushViewController(vc, animated: false)
        case .VoiceMessage :
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
            vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
//        case .PersonalMeeting :
//            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: MapVC.self)) as? MapVC else { return }
//            self.navigationController?.pushViewController(vc, animated: false)
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentReservationVC.self)) as? AppointmentReservationVC else { return }
            self.navigationController?.pushViewController(vc, animated: false)
        }
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
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChooseDurationCell.self), for: indexPath) as? ChooseDurationCell else{ return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseDurationHeaderCell") as? ChooseDurationHeaderCell else{ return UITableViewCell() }
            
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseDurationFooterCell") as? ChooseDurationFooterCell else{ return UITableViewCell() }
        cell.btnMore.setTitle("More consultants".localiz(), for: .normal)
        return cell.contentView
    }
    
}

