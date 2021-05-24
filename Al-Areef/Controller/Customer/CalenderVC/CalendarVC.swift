//
//  CalenderVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 10/05/21.
//

import UIKit

class CalendarVC: UIViewController {

    var consultType : ConsultingType?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:- IBActions
    @IBAction func dismissVC(_ sender: UIButton) {
        //self.dismiss(animated: false, completion: nil)
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: AppointmentReservationVC.self)) as? AppointmentReservationVC else { return }
        vc.consultType = consultType
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
