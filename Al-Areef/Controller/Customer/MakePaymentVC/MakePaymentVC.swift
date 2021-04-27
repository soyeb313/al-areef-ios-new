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
        self.title = "Pay".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
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
    
    @IBAction func btnAddToCartPressed(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PaymentSuccessPopupVC.self)) as? PaymentSuccessPopupVC else { return }
        vc.paymentSuccessDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {

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

extension MakePaymentVC : PaymentSuccessProtocol {
    func PaymentSuccess(_ flag: Bool) {
        switch consultType {
        case .VoiceMessage,.TextMessage:
            break
        default:
            guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultantDetailsVC.self)) as? ConsultantDetailsVC else { return }
    //        vc.consultType = consultType
            self.navigationController?.pushViewController(vc, animated: false)
        }
       
    }
    
    
}
