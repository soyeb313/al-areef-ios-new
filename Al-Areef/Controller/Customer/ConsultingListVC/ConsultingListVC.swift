//
//  ConsultingListVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit

class ConsultingListVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView              : UITableView!
    @IBOutlet weak var viewBG                 : UIView!
    @IBOutlet weak var viewHeader             : UIView!
    @IBOutlet weak var lblHeader              : UILabel!
    @IBOutlet weak var btnBack             : UIButton!
    //@IBOutlet weak var btnViewappoinments: UIButton!
    
    // MARK:- Variables
    var imgArr = [#imageLiteral(resourceName: "counselling1"),#imageLiteral(resourceName: "counselling2"),#imageLiteral(resourceName: "counselling3"),#imageLiteral(resourceName: "counselling4"),#imageLiteral(resourceName: "counselling5"),#imageLiteral(resourceName: "counselling6"),#imageLiteral(resourceName: "counselling7"),#imageLiteral(resourceName: "counselling8"),#imageLiteral(resourceName: "counselling9"),#imageLiteral(resourceName: "counselling10")]
    
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
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 35
        DispatchQueue.main.async {
            self.viewBG.layerGradient(colors: [UIColor.app_Green.cgColor,UIColor.app_Gradient.cgColor])
        }
        viewHeader.semanticContentAttribute = .forceLeftToRight
        lblHeader.text = "Counselling Topics".localiz()
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            viewHeader.semanticContentAttribute = .forceRightToLeft
        }else{
            viewHeader.semanticContentAttribute = .forceLeftToRight
        }
        
        var backButton = "backButton1"
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            backButton = "backButton"
        }
        
        btnBack.setImage(UIImage(named: backButton), for: .normal)
    }
    
    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShowDetailTapped(_ sender : UIButton){
        pushConsultingTypeVC()
    }
    
    // MARK:- Push Methods
    private func pushConsultingTypeVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingTypeVC.self)) as? ConsultingTypeVC else { return }
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

extension ConsultingListVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultingListCell.self), for: indexPath) as? ConsultingListCell else{ return UITableViewCell() }
        cell.vwBack.semanticContentAttribute = .forceLeftToRight
        cell.imgCounselling.image = imgArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushConsultingTypeVC()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultingListHeaderCell") as? ConsultingListHeaderCell else{ return UITableViewCell() }
            
        return cell.contentView
    }
    
}
