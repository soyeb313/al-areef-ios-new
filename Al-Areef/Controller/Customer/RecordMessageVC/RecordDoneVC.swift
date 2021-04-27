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
        self.title = "Confirm the voice message".localiz()
        // Do any additional setup after loading the view.
        UIView.appearance().semanticContentAttribute = .forceLeftToRight

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnSend(_ sender: Any) {
        guard let vc = UIStoryboard.RecordMessage.instantiateViewController(withIdentifier: String(describing: RecordReviewVC.self)) as? RecordReviewVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnregisterAgain(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
}
