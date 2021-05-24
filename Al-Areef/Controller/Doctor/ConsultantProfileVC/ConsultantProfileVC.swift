//
//  ConsultantProfileVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit
import Photos
import AssetsLibrary
import Alamofire
import Loaf
import SVProgressHUD
class ConsultantProfileVC: UIViewController {
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var txtLink: UITextField!
    // MARK:- Outlets
    @IBOutlet weak var btnNext                : UIButton!
    @IBOutlet weak var btnUpload              : UIButton!
    @IBOutlet weak var vwDescription          : UIView!
    @IBOutlet weak var viewLink: UIView!
    var userID = ""
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func btnUpload(_ sender: UIButton) {
        if sender .tag == 0 {
            sender.tag  = 1
            self.viewLink.isHidden = false
        }else{
            sender.tag  = 0
            self.viewLink.isHidden = true

        }
    }
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Consultant's Profile".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.viewLink.isHidden = true
        self.navigationItem.leftBarButtonItem = backBtn
        self.vwDescription.setBorder(with: .lightGray, 0.8)
        self.btnUpload.setCornerRadius(radius: 5)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        if self.txtDescription.text  == "" {
            Loaf("Please describe yourself.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else   if self.txtLink.text  == ""
        {
            Loaf("Please enter video link.".localized, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "05B48B"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }else{
            SVProgressHUD.show()
            wsAddProfileDesc()
        }
   
    }
    func wsAddProfileDesc() {
       
        let parameters = [ "profile_description":txtDescription.text ?? "",
                          "video_url": txtLink.text ?? "",
                           "user_id" : userID
                          ] as [String : Any]
    

        let url = WSRequest.ConsultantAddProfileDesc()
        
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                
                let message = "\(String(describing:result))"
                print(message)
              
                DispatchQueue.main.async {
                    if result == "success"
                    {
                        let alert = UIAlertController(title: "Success", message: "You have register sucessfully.", preferredStyle: UIAlertController.Style.alert)
                          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                            self.pushLoginVC()
                          }))
                          self.present(alert, animated: true, completion: nil)
                    }
                }
            }
           
        }

    }
    
    // MARK:- Push Methods
    private func pushLoginVC() {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LoginStepOneVC.self)) as? LoginStepOneVC else { return }
        self.navigationController?.setViewControllers([vc], animated: true)
   
    }
    
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
    
} //class


