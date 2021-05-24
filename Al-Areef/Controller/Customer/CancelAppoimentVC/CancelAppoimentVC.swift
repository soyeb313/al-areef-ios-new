//
//  CancelAppoimentVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 21/05/21.
//

import UIKit

class CancelAppoimentVC: UIViewController {

    @IBOutlet weak var btnRadio4: UIButton!
    @IBOutlet weak var ConsTxtHegiht: NSLayoutConstraint!
    @IBOutlet weak var lblClientMEeting: UILabel!
    @IBOutlet weak var btnRadio3: UIButton!
    @IBOutlet weak var lblClientAssked: UILabel!
    @IBOutlet weak var btnRadio2: UIButton!
    @IBOutlet weak var lblClientLAte: UILabel!
    @IBOutlet weak var btnRadio1: UIButton!
    @IBOutlet weak var lblClientNoShow: UILabel!
    @IBOutlet weak var lblSelectReason: UILabel!
    @IBOutlet weak var txtView: PlaceholderTextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ConsTxtHegiht.constant = 0
        lblSelectReason.text = "Select Reason".localiz()
        lblClientNoShow.text = "Client No Show".localiz()
        lblClientLAte.text = "Client Late".localiz()
        lblClientAssked.text = "Client asked for cancellation".localiz()
        lblClientMEeting.text = "Cancel meeting on Doctor’s discretion".localiz()
        btnSubmit.setTitle("Submit".localiz(), for: .normal)
        txtView.placeholder = "Write here".localiz()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnSubmit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func btnRadioCheck(_ sender: Any) {
        
        switch (sender as AnyObject).tag {
        case 1:
            btnRadio1.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_active"), for: .normal)
            btnRadio2.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio3.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio4.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            self.ConsTxtHegiht.constant = 0
        case 2:
            btnRadio2.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_active"), for: .normal)
            btnRadio1.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio3.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio4.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            self.ConsTxtHegiht.constant = 0
        case 3:
            btnRadio3.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_active"), for: .normal)
            btnRadio1.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio2.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio4.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            self.ConsTxtHegiht.constant = 150
        case 4:
            btnRadio4.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_active"), for: .normal)
            btnRadio1.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio2.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            btnRadio3.setBackgroundImage(#imageLiteral(resourceName: "icon_radio_button_2_inactive"), for: .normal)
            self.ConsTxtHegiht.constant = 150
        default:
            print("default")
        }
    }
    @IBAction func btnClose(_ sender: Any) {
        self.view.isHidden = true
    }
}
