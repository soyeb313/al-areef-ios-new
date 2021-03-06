//
//  MakePaymentVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 21/04/21.
//

import UIKit

class MakePaymentVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var lblDescription               : UILabel!
    @IBOutlet weak var lblSelectVisaCard            : UILabel!
    @IBOutlet weak var lblSelectAppleCard           : UILabel!
    @IBOutlet weak var lblSelectKhdalCard           : UILabel!
    @IBOutlet weak var lblSelectWalletCard          : UILabel!
    @IBOutlet weak var lblNameCard                  : UILabel!
    @IBOutlet weak var lblNumberCard                : UILabel!
    @IBOutlet weak var lblCardVerficationCode       : UILabel!
    @IBOutlet weak var lblCardExpiryDate            : UILabel!
    @IBOutlet weak var lblCardExpiryMonth           : UILabel!
    @IBOutlet weak var lblCardExpiryYear            : UILabel!

    @IBOutlet weak var vwNameCard                   : UIView!
    @IBOutlet weak var vwNumberCard                 : UIView!
    @IBOutlet weak var txtFldNameCard               : UITextField!
    @IBOutlet weak var txtFldNumberCard             : UITextField!
    @IBOutlet weak var txtCardExpiryMonth           : UITextField!
    @IBOutlet weak var txtCardExpiryYear            : UITextField!
    @IBOutlet weak var txtCardVerficationCode       : UITextField!
    @IBOutlet weak var btnAddCard                   : UIButton!
    @IBOutlet weak var stackView: UIView!
    @IBOutlet weak var vwOption1: UIView!
    @IBOutlet weak var vwOption2: UIView!
    @IBOutlet weak var vwOption3: UIView!
    @IBOutlet weak var vwOption4: UIView!
    var words = ""
    var rate = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    var consultant_id  =  0
    // MARK:- Variables
    var consultType : ConsultingType?
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            stackView.semanticContentAttribute = .forceRightToLeft
            vwOption1.semanticContentAttribute = .forceRightToLeft
            vwOption2.semanticContentAttribute = .forceRightToLeft
            vwOption3.semanticContentAttribute = .forceRightToLeft
            vwOption4.semanticContentAttribute = .forceRightToLeft
        }else{
            stackView.semanticContentAttribute = .forceLeftToRight
            vwOption1.semanticContentAttribute = .forceLeftToRight
            vwOption2.semanticContentAttribute = .forceLeftToRight
            vwOption3.semanticContentAttribute = .forceLeftToRight
            vwOption4.semanticContentAttribute = .forceLeftToRight
        }
        
        
        
        self.title = "Pay".localiz()
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
//        let searchbtn = UIBarButtonItem(image: UIImage(named: "iossearch"), style: .plain, target: self, action: #selector(btnSearchPressed))
//        self.navigationItem.rightBarButtonItem = searchbtn
        
        vwNameCard.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwNumberCard.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        txtCardExpiryMonth.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        txtCardExpiryYear.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))

        
        txtCardVerficationCode.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        btnAddCard.setCornerRadius(radius: 4)
        self.btnAddCard.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        lblDescription.text = "Using the existing cards".localiz()
        lblSelectVisaCard.text = "1234-xxx-xxxx-xxx VISA".localiz()
        lblSelectAppleCard.text = "Use the existing card Apple".localiz()
        lblSelectKhdalCard.text="Pay payment from khadal pay".localiz()
        lblSelectWalletCard.text = "from the wallet check".localiz()
        lblNameCard.text="Name on the card".localiz()
        lblNumberCard.text="Card no".localiz()
        lblCardVerficationCode.text  = "Card verification code(CVC)".localiz()
        lblCardExpiryDate.text = "Health expiration date".localiz()
        lblCardExpiryMonth.text="Month".localiz()
        lblCardExpiryYear.text = "Year".localiz()
        btnAddCard.setTitle("Add a card".localiz(), for: .normal)
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func btnSearchPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAddToCartPressed(_ sender : UIButton){
        guard let PopVC = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PaymentSuccessPopupVC.self)) as? PaymentSuccessPopupVC else { return }
        //PopVC.view.frame = self.view.frame
        PopVC.paymentSuccessDelegate = self
        PopVC.consultType = consultType
        PopVC.words = words
        PopVC.rate = rate
        PopVC.couslingTopic_name =  couslingTopic_name
        PopVC.couslingTopic_id =  couslingTopic_id
        PopVC.consultant_id =  consultant_id
//        self.addChild(PopVC)
//        self.view.addSubview(PopVC.view)
//        PopVC.didMove(toParent: self)
//        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PaymentSuccessPopupVC.self)) as? PaymentSuccessPopupVC else { return }
//        vc.paymentSuccessDelegate = self
        PopVC.modalPresentationStyle = .overCurrentContext
        self.present(PopVC, animated: false)
    }
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {

    }
    
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("????????????????????????? Receive Memory Warning on \(self) ?????????????????????????")
    }
    
    // MARK:-
    deinit {
        debugPrint("???? Controller is removed from memory \(self) ???? ????")
    }
    
    
} //class

extension MakePaymentVC : PaymentSuccessProtocol {
    func PaymentSuccess(_ flag: Bool) {
        switch consultType {
        case .TextMessage,.VoiceMessage :
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentVC.self)) as? AppointmentVC else { return }
            vc.consultType = consultType
            vc.words = words
            vc.rate = rate
            vc.couslingTopic_name =  couslingTopic_name
            vc.couslingTopic_id =  couslingTopic_id
            vc.consultant_id =  consultant_id
            self.navigationController?.pushViewController(vc, animated: true)
        default :
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentVC.self)) as? AppointmentVC else { return }
            vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
       /* switch consultType {
        case .TextMessage:
            break
        case .VoiceMessage:
            
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentVC.self)) as? AppointmentVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
//            guard let vc = UIStoryboard.RecordMessage.instantiateViewController(withIdentifier: String(describing: RecordMessageVC.self)) as? RecordMessageVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
            self.dismiss(animated: false, completion: nil)
        case .ConsultantRegistration :
            self.navigationController?.popToRootViewController(animated: true)
            self.dismiss(animated: false, completion: nil)
            print("ConsultantRegistration")
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultantDetailsVC.self)) as? ConsultantDetailsVC else { return }
    //        vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
        }*/
       
    }
    
    
}
