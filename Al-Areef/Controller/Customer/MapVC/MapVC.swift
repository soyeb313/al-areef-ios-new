//
//  MapVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 29/04/21.
//

import UIKit

class MapVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var vwSearchBack             : UIView!
    @IBOutlet weak var lbllocationDescription   : UILabel!
    @IBOutlet weak var lblDescription           : UILabel!
    @IBOutlet weak var btnConfirmLocation       : UIButton!
    @IBOutlet weak var btnSkip       : UIButton!
    
    
    
    var consultType : ConsultingType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vwSearchBack.setCornerRadius(radius: vwSearchBack.frame.height / 2)
        setUpView()
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
        self.title = "Select meeting location".localiz()
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        let backBtn = UIBarButtonItem(image: UIImage(named: backButton), style: .plain, target: self, action: #selector(btnBackPressed))
        self.navigationItem.leftBarButtonItem = backBtn
        
        lbllocationDescription.text = "Use my current location".localiz()
        btnConfirmLocation.setTitle("Confirm location".localiz(), for: .normal)
        btnSkip.setTitle("Skip".localiz(), for: .normal)
        
        btnConfirmLocation.setCornerRadius(radius: 5)
        btnConfirmLocation.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
        btnSkip.setCornerRadius(radius: 5)
        btnSkip.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        
    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSelectLocation(_ sender : UIButton) {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnConfirmLocation(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnSkipLocation(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ChooseDurationVC.self)) as? ChooseDurationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    
    // MARK:- Push Methods
    private func pushConsultingDurationVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingDurationVC.self)) as? ConsultingDurationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }

}
