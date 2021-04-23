//
//  PaymentSuccessPopupVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 22/04/21.
//

import UIKit

class PaymentSuccessPopupVC: UIViewController {

    @IBOutlet weak var vwBack                : UIView!
    @IBOutlet weak var btnContinue           : UIButton!
    @IBOutlet weak var lblDescription        : UILabel!
    @IBOutlet weak var lblSubDescription     : UILabel!
    @IBOutlet weak var lblAmount             : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.view.isOpaque = false
        vwBack.setCornerRadius(radius: 10)
        vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        btnContinue.setCornerRadius(radius: 5)
        btnContinue.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        btnContinue.setTitle("Continue to record the message".localiz(), for: .normal)
        self.lblDescription.text = "Payment successful".localiz()
        self.lblAmount.text = "$10.00".localiz()
        self.lblSubDescription.text = "Thank you for payment and you can now up to record your message.".localiz()
    }
    
    //MARK:- IBActions
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnContinuePressed(_ sender : UIButton){
        self.dismiss(animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
