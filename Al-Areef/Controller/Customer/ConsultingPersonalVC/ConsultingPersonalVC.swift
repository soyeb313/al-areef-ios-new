//
//  ConsultingPersonalVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingPersonalVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
    @IBOutlet weak var viewBG             : UIView!
    
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        
        DispatchQueue.main.async {
            self.viewBG.layerGradient(colors: [UIColor.app_Green.cgColor,UIColor.white.cgColor])
            
        }

    }
    
    // MARK:- Button Actions
    @objc private func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRegisterTapped(_ sender : UIButton){
        pushConsultingListVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultingListVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingListVC.self)) as? ConsultingListVC else { return }
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

extension ConsultingPersonalVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultingPersonalCell.self), for: indexPath) as? ConsultingPersonalCell else{ return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
