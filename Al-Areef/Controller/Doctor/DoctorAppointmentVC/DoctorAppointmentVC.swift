//
//  AppointmentVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 01/06/21.
//

import UIKit

class DoctorAppointmentVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    @IBOutlet weak var vwSearchBack               : UIView!
    @IBOutlet weak var segmentedControl : ScrollableSegmentedControl!
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
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

    // MARK:- SetUpView
    private func setUpView() {
        self.navigationItem.title = "Today's Appointment".localiz()
//        self.title = "Today's Appointment".localiz()
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
        self.vwSearchBack.setCornerRadius(radius: 5)
        self.vwSearchBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        
        segmentedControl.segmentStyle = .textOnly
        
        segmentedControl.insertSegment(withTitle: "All", image: #imageLiteral(resourceName: "stethoscope-1"), at: 0)
        segmentedControl.insertSegment(withTitle: "Audio Call", image: #imageLiteral(resourceName: "stethoscope-1"), at: 1)
        segmentedControl.insertSegment(withTitle: "Video Call", image: #imageLiteral(resourceName: "stethoscope-1"), at: 2)
        segmentedControl.insertSegment(withTitle: "Personal Meeting", image: #imageLiteral(resourceName: "stethoscope-1"), at: 3)
        
        
        segmentedControl.underlineSelected = true
        
        segmentedControl.addTarget(self, action: #selector(self.segmentSelected(sender:)), for: .valueChanged)
        
        // change some colors
        segmentedControl.segmentContentColor = UIColor.app_MdiumTextColor
        segmentedControl.selectedSegmentContentColor = UIColor.app_Green
        segmentedControl.backgroundColor = UIColor.clear
        
        // Turn off all segments been fixed/equal width.
        // The width of each segment would be based on the text length and font size.
        segmentedControl.fixedSegmentWidth = false
        
        segmentedControl.selectedSegmentIndex = 0
        
    }

    // MARK:- Button Actions
    @objc private func onNotificationPressed() {
        
    }
    
    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
        print("Segment at index \(sender.selectedSegmentIndex)  selected")
    }
    
}
