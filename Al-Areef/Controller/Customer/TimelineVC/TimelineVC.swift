//
//  TimelineVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class TimelineVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView            : UITableView!
    
    // MARK:- Variables
    var consultType : ConsultingType?
    var consultTypeArr = [ConsultingType.VoiceMessage,ConsultingType.TextMessage,ConsultingType.AudioConnections,ConsultingType.VideoConnections,ConsultingType.PersonalMeeting]
    var qualifications = ["Qualifications".localiz(),"Previous positions".localiz(),"Work Experience".localiz()]
    var courses = ["Courses Published".localiz(),"Webinars".localiz()]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    

    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Timeline".localiz()
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
    

}
