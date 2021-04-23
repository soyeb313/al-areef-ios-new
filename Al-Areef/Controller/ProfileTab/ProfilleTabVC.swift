//
//  ProfilleTabVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 10/04/21.
//

import UIKit

class ProfilleTabVC: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnSaveChanges             : UIButton!
    
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var txTabuk: UITextField!
    @IBOutlet weak var lblTabuk: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var lblUserId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSaveChanges.setCornerRadius(radius: 4)
        self.btnSaveChanges.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        self.tabBarController?.navigationItem.title = "My File"
        self.tabBarController?.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        txTabuk.placeholder = "Put the text here".localiz()
        txtUserName.placeholder = "User Name".localiz()
        txtUserId.placeholder = "Put the text here".localiz()
        txtMobileNumber.placeholder = "Put the text here".localiz()
        txtPhoneNumber.placeholder = "Put the text here".localiz()
        txtemail.placeholder = "Put the text here".localiz()
        lblEmail.text = "Email".localiz()
        lblTabuk.text = "Tabuk".localiz()
        lblUserId.text = "User ID".localiz()
        lblPhoneNumber.text = "Phone number".localiz()
        lblMobileNumber.text = "Mobile".localiz()
        self.btnSaveChanges.setTitle("Save Changes".localiz(), for: .normal)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.tabBarController?.navigationController?.isNavigationBarHidden = true
    }

}
