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
        self.title = "Record the message".localiz()
        
    }
    

    @IBAction func btnPressRecord(_ sender: Any) {
        guard let vc = UIStoryboard.RecordMessage.instantiateViewController(withIdentifier: String(describing: RecordDoneVC.self)) as? RecordDoneVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    

}
