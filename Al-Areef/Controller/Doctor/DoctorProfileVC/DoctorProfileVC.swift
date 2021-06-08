//
//  DoctorProfileVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

enum DoctorProfileOptions : String {
    case FirstName = "First Name"
    case LastName = "Last Name"
    case Email = "Email"
    case PhoneNumber = "Phone Number"
    case Gender = "Gender"
    case Age = "Age"
    case ChangePassword = "Change Password"
    case HighestAcademicQualification = "Highest Academic Qualification"
    case workExperience = "workExperience"
}

class DoctorProfileVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    
    var selectedIndex = 0
    var doctorProfileOptions = [DoctorProfileOptions.FirstName,DoctorProfileOptions.LastName,DoctorProfileOptions.Email,DoctorProfileOptions.PhoneNumber,DoctorProfileOptions.Gender,DoctorProfileOptions.Age,DoctorProfileOptions.ChangePassword,DoctorProfileOptions.HighestAcademicQualification,DoctorProfileOptions.workExperience]
    var sevice = ["Voice Notes","Text Message"]
    var area = ["Area 01","Area 02"]
    override func viewDidLoad() {
            super.viewDidLoad()
        setUpView()
            // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    

    // MARK:- SetUpView
    private func setUpView() {
//        self.navigationController?.title = "My Profile".localiz()
        self.navigationItem.title = "My Profile".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
//        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
//
//        self.navigationItem.leftBarButtonItem = backBtn
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "bell2"), style: .plain, target: self, action: #selector(onNotificationPressed))
        
        self.navigationItem.rightBarButtonItem = addBtn
        
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 20
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    
    }

    // MARK:- Button Actions
    @objc private func onNotificationPressed() {
        
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        self.selectedIndex = sender.selectedSegmentIndex
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }


}
