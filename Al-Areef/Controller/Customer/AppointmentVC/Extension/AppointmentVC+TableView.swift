//
//  AppointmentVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 18/05/21.
//

import Foundation
import UIKit
import SVProgressHUD
import Loaf
extension AppointmentVC : UITableViewDelegate, UITableViewDataSource{
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return self.arrRecommendation.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AppointmentProfileCell.self), for: indexPath) as? AppointmentProfileCell else{ return UITableViewCell() }
            switch consultType {
            case .TextMessage:
                cell.imgVw.image = #imageLiteral(resourceName: "mdtext")
                cell.lblType.text = "Start Typing".localiz()
            case .VoiceMessage:
                cell.imgVw.image = #imageLiteral(resourceName: "microphone-2")
                cell.lblType.text = "Start Recording".localiz()
            
            default:
                cell.imgVw.isHidden = true
                cell.lblType.text = "Manage this booking".localiz()
            }
            cell.ImgProfile.image = #imageLiteral(resourceName: "doctor")
            cell.lblName.text = self.name
            cell.lblLocation.text = self.location
            cell.lblJobTitle.text = self.jobTitle
            cell.lblCounslingTopic.text = self.couslingTopic_name
            cell.lblDuration.text = self.words
            cell.lblRate.text = self.rate
            return cell
        
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PreviousRecommendationsCell.self), for: indexPath) as? PreviousRecommendationsCell else{ return UITableViewCell() }
           
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func GetConsulatantDetails() {
        let parameters = [ "user_id": self.consultant_id,
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.GetCounsultantDetails()
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
                        let data  = responseDict["data"] as! NSArray
                        if let obj = data[0] as? NSDictionary
                        {
                            self.name = obj["full_name"] as! String
                            let arrwork =  obj["work_experience"] as! NSArray
                            
                            if let obj1 = arrwork[0] as? NSDictionary
                            {
                                self.jobTitle = obj1["job_title"] as! String
                            }
                            
                            self.location =  responseDict["area"] as?  String ?? "Kuwait city kuwait"
                            
                        }
                        
                        self.tableView.reloadData()

                       
                    
                    }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
}
