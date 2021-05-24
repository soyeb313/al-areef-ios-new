//
//  PopupVoiceTextVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 19/05/21.
//

import UIKit

class PopupVoiceTextVC: UIViewController {

    @IBOutlet weak var btnTemp : UIButton!
    var isFromVoice = true
    override func viewDidLoad() {
        super.viewDidLoad()

        if isFromVoice {
            btnTemp.setImage(#imageLiteral(resourceName: "Popup_screen"), for: .normal)
        }else{
            btnTemp.setImage(#imageLiteral(resourceName: "popup_screen2"), for: .normal)
        }
    }
    

    @IBAction func btnComplete(_ sender : UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }

}
