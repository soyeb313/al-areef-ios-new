//
//  ConsultantDetailsVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 27/04/21.
//

import UIKit

class ConsultantDetailsVC: UIViewController {

    @IBOutlet weak var vwConsultantProfileBack: UIView!
    @IBOutlet weak var vwAppointmentDetailBack: UIView!
    @IBOutlet weak var vwRatingDetailBack: UIView!
    @IBOutlet weak var vwTextNoteBack: UIView!
    @IBOutlet weak var lblHeader2: UILabel!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblSubHeader: UILabel!
    @IBOutlet weak var lblDesignationr: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVoiceCall: UILabel!
    @IBOutlet weak var lblAppointmentStatusTitle: UILabel!
    @IBOutlet weak var lblAppointmentStatus: UILabel!
    @IBOutlet weak var lblReminder: UILabel!
    @IBOutlet weak var lblCallQuality: UILabel!
    @IBOutlet weak var lblQualityofservice: UILabel!
    @IBOutlet weak var lblConsultantEvaluation: UILabel!
    @IBOutlet weak var txtVwAdditionInfo: PlaceholderTextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnBookAnotherAppointment: UIButton!
    @IBOutlet weak var lblAppointmentDate             : UILabel!
    
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
        self.title = "Consutation details".localiz()
        let backBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        vwConsultantProfileBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwAppointmentDetailBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwRatingDetailBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        vwTextNoteBack.setCornerRadius(radius: 3)
        vwTextNoteBack.setBorder(with: .lightGray, 0.5)
        
        lblHeader2.text = "How was your experience with our consultant Dr.Anila Khaldoum".localiz()
        lblHeader.text = "subject matter of counseling".localiz()
        lblSubHeader.text = "Family relations".localiz()
        lblDesignationr.text = "Dr. Anila Khaldoum".localiz()
        lblName.text = "Dr. Anila Khaldoum".localiz()
        lblVoiceCall.text = "Voice call".localiz()
        lblAppointmentStatusTitle.text = "Appointment status".localiz()
        lblAppointmentStatus.text = "has been confirmed".localiz()
        lblReminder.text = "You will receive periodic reminders before the date of the voice call".localiz()
        lblCallQuality.text = "Call quality".localiz()
        lblQualityofservice.text = "Quality of service".localiz()
        lblConsultantEvaluation.text = "Consultant evaluation".localiz()
        txtVwAdditionInfo.placeholder = "Please write additional notes here".localiz()
        btnSubmit.setTitle("Submit".localiz(), for: .normal)
        btnBookAnotherAppointment.setTitle("Book another appointment".localiz(), for: .normal)
        lblAppointmentDate.text = "2021 Thursday 19 April".localiz()
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextPressed(_ sender : UIButton){
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ConsultingTypeVC.self) {
                self.navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    
    // MARK:- Push Methods
    private func pushMakePaymentVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: CartVC.self)) as? CartVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
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


