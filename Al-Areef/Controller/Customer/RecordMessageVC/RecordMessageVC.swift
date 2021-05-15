//
//  RecordMessageVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 27/04/21.
//

import UIKit

class RecordMessageVC: UIViewController {

    @IBOutlet weak var lblPressInfo: UILabel!
    @IBOutlet weak var lblTimePassed: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Record the message".localiz()
        lblPressInfo.text = "Press the circle button to start or stop recording".localiz()
        lblTimePassed.text = "Time has passed".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnPressRecord(_ sender: Any) {
        guard let vc = UIStoryboard.RecordMessage.instantiateViewController(withIdentifier: String(describing: RecordDoneVC.self)) as? RecordDoneVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    

}
