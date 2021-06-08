//
//  ConsultingListVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 20/04/21.
//

import UIKit
import SVProgressHUD
import Loaf
import SDWebImage
class ConsultingListVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView          : UITableView!
    @IBOutlet weak var viewBG             : UIView!
    @IBOutlet weak var viewHeader             : UIView!
    @IBOutlet weak var lblHeader             : UILabel!
    //@IBOutlet weak var btnViewappoinments: UIButton!
    // MARK:- Variables
    var arrTopics = NSArray()
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        SVProgressHUD.show()
        wsGetCounslingTopic()
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
    }
    
    // MARK:- Button Actions
    @IBAction func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShowDetailTapped(_ sender : UIButton){
       // pushConsultingTypeVC(indexpath: 0)
    }
    
    // MARK:- Push Methods
    private func pushConsultingTypeVC(indexpath:IndexPath) {
        var name = ""
        var id = 0
        if let dict = arrTopics[indexpath.row] as? NSDictionary {
            name = dict ["name"] as? String ?? ""
            id = dict ["id"] as? Int ?? 0
        }
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: ConsultingTypeVC.self)) as? ConsultingTypeVC else { return }
        vc.couslingTopic_name = name
        vc.couslingTopic_id = id
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
        return arrTopics.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultingListCell.self), for: indexPath) as? ConsultingListCell else{ return UITableViewCell() }
        cell.vwBack.semanticContentAttribute = .forceLeftToRight
        if let dict = arrTopics[indexPath.row] as? NSDictionary {
            cell.lblTitle.text = dict ["name"] as? String
            let imgName = dict["img"] as? String
            let img = "http://alarif.itindiatechnology.in/public/images/" + "\(imgName ?? "counselling8")"
            let picUrl = URL(string: img )
            cell.imgCounselling!.sd_setImage(
                with: picUrl,
                placeholderImage: UIImage(named: "counselling8"),
                options: SDWebImageOptions(rawValue: 0),
                completed: { image, error, cacheType, imageURL in
                    // guard let selfNotNil = self else { return }
                    // your rest code
                    //cell.postedImage.contentMode = .scaleAspectFill
                }
            )
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushConsultingTypeVC(indexpath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultingListHeaderCell") as? ConsultingListHeaderCell else{ return UITableViewCell() }
            
        return cell.contentView
    }
    
    func wsGetCounslingTopic() {
        let parameters = [ "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.GetCounslingTopics()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                     let userDetails = responseDict["user_details"] as? NSDictionary
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                     
                        self.arrTopics = responseDict["data"] as! NSArray
                        self.tableView.reloadData()
//                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                        let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
//                        self.navigationController?.pushViewController(vc, animated: true)
//                        Loaf("You have login  sucessfully..", state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "15B525"), icon: UIImage(named: "toast_sucess"))), location: .top, sender: self).show()
                       
                    
                    }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
    
}
