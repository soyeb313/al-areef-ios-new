//
//  SideMenuVC.swift
//  GPS_Columbia
//
//  Created by Shashikant's_Macmini on 08/10/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

enum SideMenuOptions : String {
    case Profile = "Profile"
    case Appointments = "Appointments"
    case ServicesInbox = "Services Inbox"
    case SubServicesInbox = "Sub Services Inbox"
    case ManageCourses = "Manage Courses"
    case ConsultantTimeline = "Consultant Timeline"
    case Notifications = "Notifications"
    case ServedPatients = "Served Patients"
    case WorkSchedule = "Work Schedule"
    case Prescription = "Prescription"
    case Wallet = "Wallet"
    case Logout = "Consultation Fees"
    case VoiceMessageInbox = "Voice Message Inbox"
    case TextMessageInbox = "Text Message Inbox"
    case VoiceCallInbox = "Voice Call Inbox"
    case VideoCallInbox = "Video Call Inbox"
    case PersonalMeetingInbox = "Personal Meeting Inbox"
    
}

final class SideMenuVC: UIViewController {
    
    
    
    // MARK:- Outlets
    @IBOutlet weak var tableView        : UITableView!
    @IBOutlet weak var btnBack          : UIButton!
    @IBOutlet weak var viewSOS          : UIView!
    @IBOutlet weak var btnSOS           : UIButton!
    @IBOutlet weak var lblLogout        : UILabel!
        
    // MARK:- Variables
    var arrListing: [SideMenuOptions] = []
    var onDidSelect: ((SideMenuOptions)->())?
    var onLogoutPressed: (()->())?
    //var profilePicModel : UploadProfileModel?
    var imgarr = [#imageLiteral(resourceName: "appointmentsicon"),#imageLiteral(resourceName: "servicesinbox"),#imageLiteral(resourceName: "managecourses"),#imageLiteral(resourceName: "consultanttimeline"),#imageLiteral(resourceName: "notifications"),#imageLiteral(resourceName: "servedPatients"),#imageLiteral(resourceName: "workschedule"),#imageLiteral(resourceName: "prescription"),#imageLiteral(resourceName: "walletWhite"),#imageLiteral(resourceName: "consultationfees")]
    var imgSubarr = [#imageLiteral(resourceName: "appointmentsicon"),#imageLiteral(resourceName: "servicesinbox"),#imageLiteral(resourceName: "managecourses"),#imageLiteral(resourceName: "consultanttimeline"),#imageLiteral(resourceName: "consultationfees")]
    var isServicesInbox = false
    var servicesInbox = [SideMenuOptions.VoiceMessageInbox,SideMenuOptions.TextMessageInbox,SideMenuOptions.VoiceCallInbox,SideMenuOptions.VideoCallInbox,SideMenuOptions.PersonalMeetingInbox]
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        //UploadProfileModel.getProfilePic(complection: api_onGetProfilePic)
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        arrListing = [
            .Profile,
            .Appointments,
            .ServicesInbox,
            .ManageCourses,
            .ConsultantTimeline,
            .Notifications,
            .ServedPatients,
            .WorkSchedule,
            .Prescription,
            .Wallet,
            .Logout,
        ]
        
//        viewSOS.setCorner(withRadius: viewSOS.frame.height * 0.5)
//        DispatchQueue.main.async {
//            self.viewSOS.setShadow(clr: .lightGray, sRadius: 4, cRadius: (self.viewSOS.frame.height * 0.5))
//        }
        tableView.delegate = self
        tableView.dataSource = self
        lblLogout.text = "Sign out".localiz()
    }
    
    // MARK:- Button Actions
    @IBAction private func btnBackPressed() {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction private func btnLogoutPressed() {
        self.dismiss(animated: false, completion: nil)
        onLogoutPressed?()
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
