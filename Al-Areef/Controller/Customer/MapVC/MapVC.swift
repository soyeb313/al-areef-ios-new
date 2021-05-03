//
//  MapVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 29/04/21.
//

import UIKit

class MapVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var vwSearchBack          : UIView!
    
    var consultType : ConsultingType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vwSearchBack.setCornerRadius(radius: vwSearchBack.frame.height / 2)
    }
    
    
    @IBAction func btnSelectLocation(_ sender : UIButton) {
        pushConsultingDurationVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultingDurationVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingDurationVC.self)) as? ConsultingDurationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }

}
