//
//  DasBoardCustViewController.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 10/04/21.
//

import UIKit

class DasBoardCustViewController: UIViewController {

    @IBOutlet weak var tblServices: UITableView!
    @IBOutlet weak var btnViewappoinments: UIButton!
    @IBOutlet weak var viewBG             : UIView!
    @IBOutlet weak var viewHeader             : UIView!
    var arrTitle = ["Consulting personal","Consulting comapanies", "Courses", "Al-Dhasal bank", "Ask us","Adviser","Who we are","Conatact Us"]
    var arrBtnTitle = ["The beginning","Hands", "The beginning", "Ask us", "The beginning","Better","Call","Show"]
    var arrImages : [UIImage] = [#imageLiteral(resourceName: "Image-1"),#imageLiteral(resourceName: "Image-2"),#imageLiteral(resourceName: "Image-3"),#imageLiteral(resourceName: "Image-4"),#imageLiteral(resourceName: "Image-2"),#imageLiteral(resourceName: "Image-6"),#imageLiteral(resourceName: "Image-5"),#imageLiteral(resourceName: "Image-7")]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnViewappoinments.layer.cornerRadius = 10
        self.btnViewappoinments.layer.masksToBounds = true
        self.btnViewappoinments.layer.borderWidth = 1
        self.btnViewappoinments.layer.borderColor = UIColor.white.cgColor
        self.btnViewappoinments.setTitle("View appointments".localiz(), for: .normal)
        setUpView()
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            self.viewHeader.semanticContentAttribute = .forceRightToLeft
        }else{
            self.viewHeader.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        
        
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.tblServices.sectionHeaderHeight = UITableView.automaticDimension
        self.tblServices.estimatedSectionHeaderHeight = 35
        DispatchQueue.main.async {
            self.viewBG.layerGradient(colors: [UIColor.app_Green.cgColor,UIColor.app_Gradient.cgColor,UIColor.app_Gradient.cgColor])
            
        }
        
        

    }
    
    
    // MARK:- Push Methods
    private func pushConsultingPersonalVC() {
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingPersonalVC.self)) as? ConsultingPersonalVC else { return }
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension DasBoardCustViewController : UITableViewDelegate, UITableViewDataSource
{
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if arrTitle[indexPath.row] == "Conatact Us"{
            let cell = tableView.dequeueReusableCell(withIdentifier:"DashBoardVideoCell", for: indexPath) as! DashBoardVideoCell
            cell.btnAction.setTitle(arrBtnTitle[indexPath.row].localiz(), for: .normal)
            //cell.imgServices.image = arrImages[indexPath.row]
            cell.btnAction.layer.cornerRadius = 5
            cell.btnAction.layer.masksToBounds = true
            cell.vwBack.semanticContentAttribute = .forceLeftToRight
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier:"DashBoardTableViewCell", for: indexPath) as! DashBoardTableViewCell
            cell.lblTitleSertvice.text = arrTitle[indexPath.row].localiz()
            cell.btnAction.setTitle(arrBtnTitle[indexPath.row].localiz(), for: .normal)
            cell.imgServices.image = arrImages[indexPath.row]
            cell.btnAction.layer.cornerRadius = 5
            cell.btnAction.layer.masksToBounds = true
            cell.vwBack.semanticContentAttribute = .forceLeftToRight
            return cell
        }
        

        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushConsultingPersonalVC()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderCell") as? HomeHeaderCell else{ return UITableViewCell() }
            
        return cell.contentView
    }
}
