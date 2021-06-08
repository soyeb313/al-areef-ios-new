//
//  DoctorHomeVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

class DoctorHomeVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
    @IBOutlet weak var viewBG             : UIView!
    @IBOutlet weak var viewHeader             : UIView!
    @IBOutlet weak var lblHeader             : UILabel!
    @IBOutlet weak var btnHome             : UIButton!
    // MARK:- Variables
    var appointment = ["Appointments".localiz(),"Services Inbox".localiz(),"Courses".localiz(),"Webinars".localiz(),"Exams".localiz(),"Reports".localiz()]
    var imgArr = [#imageLiteral(resourceName: "Image-1"),#imageLiteral(resourceName: "Inbox"),#imageLiteral(resourceName: "courses"),#imageLiteral(resourceName: "webinar"),#imageLiteral(resourceName: "Exams"),#imageLiteral(resourceName: "Exams")]
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 35
        lblHeader.text =  "Dashboard".localiz()
        DispatchQueue.main.async {
            self.viewBG.layerGradient(colors: [UIColor.app_Green.cgColor,UIColor.app_Gradient.cgColor,UIColor.app_Gradient.cgColor])
            
        }
       
    }
    // MARK:- Push Methods
    func showSideMenu() {
        if let tabbarVC = self.tabBarController as? DoctorTabBarVC {
            tabbarVC.showSideMenuVC()
        }
    }
    
    // MARK:- Button Actions
    @IBAction private func btnSideMenuPressed() {
        showSideMenu()
    }
    
    // MARK:- Push Methods
    private func pushConsultingListVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingListVC.self)) as? ConsultingListVC else { return }
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
