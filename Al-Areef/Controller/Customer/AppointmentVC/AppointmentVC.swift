//
//  AppointmentVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class AppointmentVC: UIViewController {

    @IBOutlet weak var viewCancel: UIView!
    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    
    @IBOutlet weak var brnClose: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnResecdule: UIButton!
    // MARK:- Variables
    var consultType : ConsultingType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.viewCancel.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Timeline".localiz()
        btnResecdule.setTitle("Reschedule".localiz(), for: .normal)
        btnCancel.setTitle("Cancel".localiz(), for: .normal)
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.reloadData()
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnresecdule(_ sender: Any) {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CalendarVC.self)) as? CalendarVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        guard let PopVC = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CancelAppoimentVC.self)) as? CancelAppoimentVC else { return }
        PopVC.view.frame = self.view.frame
        self.addChild(PopVC)
        self.view.addSubview((PopVC.view)!)
        PopVC.didMove(toParent: self)
    }
    
    @IBAction func btnclose(_ sender: Any) {
        self.viewCancel.isHidden = true
    }
    
    @IBAction func btnNextVC(_ sender : UIButton){
        switch consultType {
        case .TextMessage:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: TextMessageVC.self)) as? TextMessageVC else { return }
            self.navigationController?.pushViewController(vc, animated: false)
        case .VoiceMessage:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: VoiceMessageVC.self)) as? VoiceMessageVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            self.dismiss(animated: false, completion: nil)
        case .AudioConnections:
            self.viewCancel.isHidden = false
        case .VideoConnections:
            self.viewCancel.isHidden = false
        case .PersonalMeeting:
            self.viewCancel.isHidden = false
        case .ConsultantRegistration :
            self.navigationController?.popToRootViewController(animated: true)
            self.dismiss(animated: false, completion: nil)
            print("ConsultantRegistration")
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultantDetailsVC.self)) as? ConsultantDetailsVC else { return }
    //        vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }

}
