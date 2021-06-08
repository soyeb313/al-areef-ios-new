//
//  CartVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 11/05/21.
//

import UIKit

class CartVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var btnPayment           : UIButton!
    @IBOutlet weak var lblCart              : UILabel!
    @IBOutlet weak var lblCartDescription   : UILabel!
    @IBOutlet weak var lblTopicNameTitle    : UILabel!
    @IBOutlet weak var lblServiceNameTitle       : UILabel!
    @IBOutlet weak var lblDurationTitle          : UILabel!
    @IBOutlet weak var lblFeesTitle              : UILabel!
    @IBOutlet weak var lblNameTitle              : UILabel!
    @IBOutlet weak var lblTopicName         : UILabel!
    @IBOutlet weak var lblServiceName       : UILabel!
    @IBOutlet weak var lblDuration          : UILabel!
    @IBOutlet weak var lblFees              : UILabel!
    @IBOutlet weak var lblName              : UILabel!
    var words = ""
    var rate = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    var consultant_id  =  0
    
    // MARK:- Variables
    var consultType : ConsultingType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Cart".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        self.vwBack.setCornerRadius(radius: 10)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBack.setBorder(with: .app_MdiumTextColor, 1)
        self.btnPayment.setCornerRadius(radius: 5)
        btnPayment.setShadow()
        self.btnPayment.setTitle("Proceed to payment".localiz(), for: .normal)
        lblCart.text = "Cart".localiz()
        
        lblTopicNameTitle.text = "Topic Name".localiz() + ":"
         lblServiceNameTitle.text = "Service Name".localiz() + ":"
         lblDurationTitle.text = "Duration".localiz() + ":"
         lblFeesTitle.text = "Fees".localiz() + ":"
         lblNameTitle.text = "Name".localiz() + ":"
        lblServiceName.text = consultType?.rawValue
        
        lblTopicName.text = couslingTopic_name
        lblDuration.text = words
        lblFees.text = rate
        lblName.text = UserDefaults.standard.value(forKey: User_defaults_Constants.full_name) as? String
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPaymentTapped(_ sender : UIButton){
        pushMakePaymentVC()
    }

    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: MakePaymentVC.self)) as? MakePaymentVC else { return }
        vc.consultType = consultType
        vc.words = words
        vc.rate = rate
        vc.couslingTopic_name =  couslingTopic_name
        vc.couslingTopic_id =  couslingTopic_id
        vc.consultant_id =  consultant_id
       
        self.navigationController?.pushViewController(vc, animated: false)
    }

}
