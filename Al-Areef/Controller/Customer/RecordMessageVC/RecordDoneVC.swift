//
//  RecordDoneVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 27/04/21.
//

import UIKit

class RecordDoneVC: UIViewController {

    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnRegisteragin: UIButton!
    @IBOutlet weak var lblTimeInfo: UILabel!
    @IBOutlet weak var lblTimePassed: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Confirm the voice message".localiz()
        // Do any additional setup after loading the view.
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        setUpView()
    }
    

    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Confirm the voice message".localiz()
        lblTimePassed.text = "Time has passed".localiz()
        lblTimeInfo.text = "Press the circle button to start or stop recording".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        btnRegisteragin.setTitle("Record again".localiz(), for: .normal)
        btnSend.setTitle("Send".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnSend(_ sender: Any) {
        guard let vc = UIStoryboard.RecordMessage.instantiateViewController(withIdentifier: String(describing: RecordReviewVC.self)) as? RecordReviewVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnregisterAgain(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
}
