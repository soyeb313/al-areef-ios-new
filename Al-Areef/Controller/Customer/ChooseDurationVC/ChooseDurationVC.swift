//
//  ChooseDurationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit
import SVProgressHUD
import Loaf
class ChooseDurationVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
   
    // MARK:- Variables
    var selectedServices = ""
    var consultType : ConsultingType?
    var navFlag = ""
    var words = ""
    var rate = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    var arrConsultPerson = NSArray()
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
        
        switch consultType {
        case .TextMessage:
            selectedServices = "text"
        case .VoiceMessage:
            selectedServices = "voice"
        default:
            selectedServices = "text"
        }
        GetCounsultingPerson()
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
        var docter_id = 0
        if let dict = arrConsultPerson[0] as? NSDictionary {
            docter_id   = dict["id"] as? Int ?? 0
        }

        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
        vc.consultType = consultType
        vc.words = words
        vc.rate = rate
        vc.couslingTopic_name = couslingTopic_name
        vc.couslingTopic_id = couslingTopic_id
        vc.consultant_id = docter_id
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnCalenderPressed(_ sender : UIButton){
        
            if consultType?.rawValue == "Voice message" ||  consultType?.rawValue == "Text message"
            {
                var docter_id = 0
                if let dict = arrConsultPerson[sender.tag] as? NSDictionary {
                    docter_id   = dict["id"] as? Int ?? 0
                }
                guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
                vc.consultType = consultType
                vc.words = words
                vc.rate = rate
                vc.couslingTopic_name = couslingTopic_name
                vc.couslingTopic_id = couslingTopic_id
                vc.consultant_id = docter_id
                self.navigationController?.pushViewController(vc, animated: false)
            }else{
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CalendarVC.self)) as? CalendarVC else { return }
            vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
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
              return arrConsultPerson.count
        }else{
            return arrConsultPerson.count
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
        cell.btnSelectProfile.tag = indexPath.row
        cell.btnSelectProfile.addTarget(self, action: #selector(btnCalenderPressed), for: .touchUpInside)
        if let dict = arrConsultPerson[indexPath.row] as? NSDictionary {
            cell.lblConsultantName.text = dict ["full_name"] as? String
            cell.lblExperince.text = "0 years experience".localiz()
            cell.imgProfile.image = #imageLiteral(resourceName: "doctor")
            cell.lblTitleReviewsCnt.text = "0"
            cell.lblTitleCoursesCnt.text = "0"
            cell.lblTitleYearsExperienceCnt.text = "0"
            cell.lblTitlePatientsServedCnt.text = "0"
        }
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
    
    func GetCounsultingPerson() {
        let parameters = [ "user_id":UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? "",
                           "service_type": selectedServices ,
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.GetCounsultingPerson()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                     let userDetails = responseDict["user_details"] as? NSDictionary
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                     
                       self.arrConsultPerson = responseDict["data"] as! NSArray
                        self.tableView.reloadData()
//                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
//                        self.navigationController?.pushViewController(vc, animated: true)
//                        Loaf("You have login  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                       
                    
                    }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
}

