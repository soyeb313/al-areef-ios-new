//
//  ConsultingDurationVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit
import SVProgressHUD
import Loaf
class ConsultingDurationVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var btnNext          : UIButton!
    @IBOutlet weak var btnAddWords      : UIButton!
    @IBOutlet weak var lblPrice1: UILabel!
    @IBOutlet weak var vwBack           : UIView!
    @IBOutlet weak var vwDurationBack1  : UIView!
    @IBOutlet weak var vwDurationBack2  : UIView!
    @IBOutlet weak var vwDurationBack3  : UIView!
    @IBOutlet weak var vwAddWords       : UIView!
    @IBOutlet weak var lblMin1: UILabel!
    @IBOutlet weak var lblDescription   : UILabel!
    @IBOutlet weak var lblPrice3: UILabel!
    @IBOutlet weak var lblMin3: UILabel!
    @IBOutlet weak var lblPrice2: UILabel!
    @IBOutlet weak var lbmin2: UILabel!
    @IBOutlet weak var icon1   : UIImageView!
    @IBOutlet weak var icon2   : UIImageView!
    @IBOutlet weak var icon3   : UIImageView!
    @IBOutlet weak var iconPrice1   : UIImageView!
    @IBOutlet weak var iconPrice2   : UIImageView!
    @IBOutlet weak var iconPrice3   : UIImageView!
    @IBOutlet weak var imgAppointmant   : UIImageView!
    var selectedServices = ""
    var arrTopicsDuration = NSArray()
    // MARK:- Variables
    var consultType : ConsultingType?
    var appointmantImg = UIImage()
    var rate = ""
    var words = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        SVProgressHUD.show()
        wsGetCounslingTopicDuration()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Choose Duration".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        imgAppointmant.image = appointmantImg
//        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
//        self.navigationItem.rightBarButtonItem = searchbtn
        
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack1.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack2.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwDurationBack3.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
//        btnNext.setCornerRadius(radius: 4)
        self.btnNext.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        lblDescription.text = "Please specify how long you want to book the appointment".localiz()
        btnAddWords.setTitle("+ Add words".localiz(), for: .normal)
        vwDurationBack1.semanticContentAttribute = .forceLeftToRight
        vwDurationBack2.semanticContentAttribute = .forceLeftToRight
        vwDurationBack3.semanticContentAttribute = .forceLeftToRight
        
        if consultType == ConsultingType.TextMessage {
            self.vwAddWords.isHidden = false
            lblPrice1.text = "100 dollars".localiz()
            lblPrice2.text =  "30 dollars".localiz()
            lblPrice3.text  = "60 dollars".localiz()
            lblMin1.text = "1000 words".localiz()
            lblMin3.text = "200 words".localiz()
            lbmin2.text  = "500 words".localiz()
            self.vwDurationBack2.isHidden = true
            self.vwDurationBack3.isHidden = true
            self.icon1.image = #imageLiteral(resourceName: "keyboardGreen")
            self.icon2.image = #imageLiteral(resourceName: "keyboardGreen")
            self.icon3.image = #imageLiteral(resourceName: "keyboardGreen")
            selectedServices = "text"
        }else{
            self.vwAddWords.isHidden = true
            lblPrice1.text = "10 USD".localiz()
            lblPrice2.text =  "20 USD".localiz()
            lblPrice3.text  = "30 USD".localiz()
            lblMin1.text = "10 Minutes".localiz()
            lblMin3.text = "30 Minutes".localiz()
            lbmin2.text  = "20 Minutes".localiz()
            self.vwDurationBack2.isHidden = false
            self.vwDurationBack3.isHidden = false
            
            selectedServices = "voice"
        }
        
        btnNext.setTitle("NEXT".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func btnSearchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNextTapped(_ sender : UIButton){
        if words == ""
        {
            if consultType == ConsultingType.TextMessage {
                Loaf("Please choose words. "
                     , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
            }else{
            Loaf("Please choose min. "
                 , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
        }
        }else{
        pushChooseDurationVC()
        }
    }
    
    @IBAction func btnSelectOptionTapped(_ sender : UIButton){
        resetOtpIcon()
        switch sender.tag {
        case 1:
            rate = self.lblPrice1.text!
            words = self.lblMin1.text!
            self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        case 2:
            rate = self.lblPrice2.text!
            words = self.lbmin2.text!
            self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
        default:
            self.iconPrice3.image = #imageLiteral(resourceName: "icon_radio_button_2_active")
            rate = self.lblPrice3.text!
            words = self.lblMin3.text!
        }
    }
    
    func resetOtpIcon(){
        self.iconPrice1.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        self.iconPrice2.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
        self.iconPrice3.image = #imageLiteral(resourceName: "icon_radio_button_2_inactive")
    }
    
    @IBAction func btnAddWordsTapped(_ sender : UIButton){
        self.vwDurationBack2.isHidden = false
        self.vwDurationBack3.isHidden = false
    }
    
    // MARK:- Push Methods
    private func pushChooseDurationVC() {
        
        switch consultType {
        case .TextMessage,.VoiceMessage:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
            vc.consultType = consultType
            vc.rate = rate
            vc.words = words
            vc.couslingTopic_name = couslingTopic_name
            vc.couslingTopic_id = couslingTopic_id
            self.navigationController?.pushViewController(vc, animated: false)
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: MapVC.self)) as? MapVC else { return }
            vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        
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
    
    
    func wsGetCounslingTopicDuration() {
        let parameters = [ "user_id":UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? "",
                           "service_type": selectedServices ,
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.GetCounslingTopicsDuration()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                     let userDetails = responseDict["user_details"] as? NSDictionary
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                        self.arrTopicsDuration = responseDict["data"] as! NSArray
                        var obj1 = NSDictionary()
                        var obj2 = NSDictionary()
                        var obj3 = NSDictionary()
                        obj1 = self.arrTopicsDuration[0] as! NSDictionary
                        obj2 = self.arrTopicsDuration[1] as! NSDictionary
                        obj3 = self.arrTopicsDuration[2] as! NSDictionary
                        
                        
                        if self.consultType == ConsultingType.TextMessage {
                            self.vwAddWords.isHidden = false
                            self.lblPrice1.text = "\(obj1["rate"] ?? "") KWD".localiz()
                            self.lblPrice2.text = "\(obj2["rate"] ?? "") KWD".localiz()
                            self.lblPrice3.text  = "\(obj3["rate"] ?? "") KWD".localiz()
                            self.lblMin1.text = "\(obj1["no_of_words"] ?? "") words".localiz()
                            self.lblMin3.text =  "\(obj2["no_of_words"] ?? "") words".localiz()
                            self.lbmin2.text  =  "\(obj3["no_of_words"] ?? "") words".localiz()
                            self.vwDurationBack2.isHidden = true
                            self.vwDurationBack3.isHidden = true
                            self.icon1.image = #imageLiteral(resourceName: "keyboardGreen")
                            self.icon2.image = #imageLiteral(resourceName: "keyboardGreen")
                            self.icon3.image = #imageLiteral(resourceName: "keyboardGreen")
                        }else{
                            self.vwAddWords.isHidden = true
                            self.lblPrice1.text = "10 KWD".localiz()
                            self.lblPrice2.text =  "20 KWD".localiz()
                            self.lblPrice3.text  = "30 KWD".localiz()
                            self.lblMin1.text = "10 Minutes".localiz()
                            self.lblMin3.text = "30 Minutes".localiz()
                            self.lbmin2.text  = "20 Minutes".localiz()
                            self.vwDurationBack2.isHidden = false
                            self.vwDurationBack3.isHidden = false
                            
                            self.selectedServices = "voice"
                        }
                       
                    
                    }
                }else{
                    SVProgressHUD.dismiss()
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
} //class
