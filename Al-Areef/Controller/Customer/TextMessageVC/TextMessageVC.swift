//
//  TextMessageVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 19/05/21.
//

import UIKit

class TextMessageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func btnSend(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PopupVoiceTextVC.self)) as? PopupVoiceTextVC else { return }
        vc.isFromVoice = false
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
