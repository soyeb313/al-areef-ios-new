//
//  WorkScheduleVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/05/21.
//

import UIKit
import SVProgressHUD
import Loaf

enum WorkSchedule : String{
    case title = "title"
    case day = "day"
    case morningTime = "morningTime"
    case eveningTime = "eveningTime"
    case WorkScheduleDate = "WorkScheduleDate"
    case WorkScheduleAvailability = "WorkScheduleAvailability"
    case reason = "reason"
}

struct RegularWorkSheduleMain: Codable {
    var regularWorkShedule: [RegularWorkShedule]?

    enum CodingKeys: String, CodingKey {
        case regularWorkShedule = "regular_work_shedule"
    }
}

// MARK: - RegularWorkShedule
struct RegularWorkShedule: Codable {
    var day: String?
    var morningTime = NingTime(startTime: "", endTime: "")
    var eveningTime = NingTime(startTime: "", endTime: "")
    enum CodingKeys: String, CodingKey {
        case day
        case morningTime = "Morning_time"
        case eveningTime = "evening_time"
    }
}

// MARK: - NingTime
struct NingTime: Codable {
    var startTime: String = ""
    var endTime : String = ""
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
    }
}

struct OccasionalWorkScheduleMain: Codable {
    var occasionalWorkSchedule: OccasionalWorkSchedule?

    enum CodingKeys: String, CodingKey {
        case occasionalWorkSchedule = "occasional_work_schedule"
    }
}

// MARK: - OccasionalWorkSchedule
struct OccasionalWorkSchedule: Codable {
    var startDate: String = ""
    var endDate: String = ""
    var startTime: String = ""
    var endTime: String = ""
    var availabilityType, reason: String?

    enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
        case endDate = "end_date"
        case startTime = "start_time"
        case endTime = "end_time"
        case availabilityType = "availability_type"
        case reason
    }
}

/*
 {
     "occasional_work_schedule": {
         "start_date": "12 March",
         "end_date": "16 March",
         "start_time": "02:00 AM",
         "end_time": "04:00 PM",
         "availability_type": "Partial Available",
         "reason": "ttt"
     }
 }
 */

class WorkScheduleVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    
    var WorkScheduleArr = [WorkSchedule.title,WorkSchedule.day,WorkSchedule.morningTime,WorkSchedule.eveningTime]
    var isRegular = true
    var dataSource = ["Add Regular Schedule".localiz(), "Add Occasional Schedule".localiz()]
    var dayArr = ["Monday".localiz(),"Tuesday".localiz(), "Wednesday".localiz(),"Thursday".localiz(),"Friday".localiz()]
    var availabilityArr = ["Partial Available".localiz(),"Not Working".localiz()]
    //let dropDown = MakeDropDown()
    var dropDownRowHeight: CGFloat = 50
    let transparentView = UIView()
    var regularWorkShedule: [RegularWorkShedule] = []
    var occasionalWorkSchedule : OccasionalWorkSchedule? = OccasionalWorkSchedule(startDate: "12 March", endDate: "16 March", startTime: "02:00 AM", endTime: "04:00 PM", availabilityType: "Partial Available", reason: "ttt")
    
    var startDate = ""
    var endDate = ""
    var isMorningTime = false
    var isEveningTime = false
    override func viewDidLoad() {
            super.viewDidLoad()
        setUpView()
            // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        //self.navigationController?.isNavigationBarHidden = true
    }
    

    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Work Schedule".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.leftBarButtonItem = backBtn
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        self.navigationItem.rightBarButtonItem = addBtn
       
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedSectionHeaderHeight = 20
//        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 20
        tableView.sectionFooterHeight = UITableView.automaticDimension
        if isRegular {
            WorkScheduleArr = [WorkSchedule.title,WorkSchedule.day,WorkSchedule.morningTime,WorkSchedule.eveningTime]
        }else{
            WorkScheduleArr = [WorkSchedule.title,WorkSchedule.WorkScheduleDate,WorkSchedule.WorkScheduleAvailability]
        }
        
    }

    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCalenderPressed(_ sender : UIButton){
        guard let PopVC = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CalendarVC.self)) as? CalendarVC else { return }
        PopVC.selectDateProtocol = self
        PopVC.tag = sender.tag
        PopVC.modalPresentationStyle = .overCurrentContext
        self.present(PopVC, animated: false)
    }
    
    @IBAction func btnSavePressed(_ sender : UIButton){
        SVProgressHUD.show()
        if isRegular {
            createRegularWorkSchedule()
        }else{
            createOccasionalWorkSchedule()
        }
        
    }
    
    @IBAction func btnMorningEveningPressed(_ sender : UIButton){
        if sender.tag == 0 {
            isMorningTime = !isMorningTime
            if isMorningTime {
                 sender.setImage(#imageLiteral(resourceName: "check"), for: .normal)
             }else{
                 sender.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
             }
        }else{
            isEveningTime = !isEveningTime
            if isEveningTime {
                 sender.setImage(#imageLiteral(resourceName: "check"), for: .normal)
             }else{
                 sender.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
             }
        }
       
        
    }

    func createRegularWorkSchedule(){
        let regularWorkSheduleMain : RegularWorkSheduleMain = RegularWorkSheduleMain(regularWorkShedule: regularWorkShedule)
        
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(regularWorkSheduleMain) {
            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                print(jsonString)
                
                let userProfile = UserData.returnCodableData(for: .UserProfileData, valueType: UserDetails.self)
                let userID = "\(userProfile?.id ?? 0)"
                let parameters : [String : Any] = [ "user_id": userID,
                                   "regular_work_shedule" : jsonString
                ]
                let url = WSRequest.CreateRegularWorkSchedule()
                WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
                    print(responseDict,err)
                    SVProgressHUD.dismiss()
                    if let result = responseDict["message"] as? String
                    {
                        if result == "success"  {
                            
                            let message = "\(String(describing:result))"
                            print(message)
                            
                            Loaf("Regular work schedule created".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                            
                            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.00) {
                                Loaf.dismiss(sender: self)
                                self.navigationController?.popViewController(animated: true)
                            }
                        }
                    }else{
                        Loaf(responseDict["message"] as? String ?? ""
                             , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                    }
                }
            }
        }
    }
    
    func createOccasionalWorkSchedule(){
        let occasionalWorkScheduleMain : OccasionalWorkScheduleMain = OccasionalWorkScheduleMain(occasionalWorkSchedule: self.occasionalWorkSchedule)
        
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(occasionalWorkScheduleMain) {
            if let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                print(jsonString)
                let userProfile = UserData.returnCodableData(for: .UserProfileData, valueType: UserDetails.self)
                let userID = "\(userProfile?.id ?? 0)"
                let parameters : [String : Any] = [ "user_id": userID,
                                   "occasional_work_shedule" : jsonString
                ]
                let url = WSRequest.createOccasionalWorkSchedule()
                WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
                    print(responseDict,err)
                    SVProgressHUD.dismiss()
                    if let result = responseDict["message"] as? String
                    {
                        if result == "success"  {
                            
                            let message = "\(String(describing:result))"
                            print(message)
                            
                            Loaf("Occasional work schedule created".localiz(), state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                            
                            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.00) {
                                Loaf.dismiss(sender: self)
                                self.navigationController?.popViewController(animated: true)
                            }
                        }
                    }else{
                        Loaf(responseDict["message"] as? String ?? ""
                             , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                    }
                }
            }
        }
    }

    
    
}

extension WorkScheduleVC : SelectDateProtocol {
    func selectedDate(_ tag: Int, dateStr: String) {
        if tag == 0 {
            self.startDate = dateStr
        }else if tag == 1 {
            self.endDate = dateStr
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension Dictionary {
    
    /// Convert Dictionary to JSON string
    /// - Throws: exception if dictionary cannot be converted to JSON data or when data cannot be converted to UTF8 string
    /// - Returns: JSON string
    func toJson() throws -> String {
        let data = try JSONSerialization.data(withJSONObject: self)
        if let string = String(data: data, encoding: .utf8) {
            return string
        }
        throw NSError(domain: "Dictionary", code: 1, userInfo: ["message": "Data cannot be converted to .utf8 string"])
    }
}

//extension WorkScheduleVC: MakeDropDownDataSourceProtocol{
//    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
//        if makeDropDownIdentifier == "DROP_DOWN_NEW"{
//            let customCell = cell as! DropDownTableViewCell
//            customCell.lblName.text =  self.availabilityArr[indexPos]
//
//            print("test")
//        }
//    }
//
//    func numberOfRows(makeDropDownIdentifier: String) -> Int {
//        return self.availabilityArr.count
//    }
//
//    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {
//        //self.testLabel.text = "Country: \(self.cityModelArr[indexPos].countryName) City: \(self.cityModelArr[indexPos].cityName)"
//        print("selected Availablity",self.availabilityArr[indexPos] )
//        if self.availabilityArr[indexPos] == "Partial Available"{
//            WorkScheduleArr = [WorkSchedule.title,WorkSchedule.WorkScheduleDate,WorkSchedule.WorkScheduleAvailability,WorkSchedule.morningTime,WorkSchedule.eveningTime]
//        }else{
//            WorkScheduleArr = [WorkSchedule.title,WorkSchedule.WorkScheduleDate,WorkSchedule.WorkScheduleAvailability,WorkSchedule.reason]
//        }
//        self.tableView.reloadData()
//        self.dropDown.hideDropDown()
//    }
//
//}
