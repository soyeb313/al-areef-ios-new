//
//  DoctorHomeVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

extension DoctorHomeVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return appointment.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return UITableView.automaticDimension
        }else{
            return CGFloat.leastNonzeroMagnitude
        }
        
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorHomeTimerCell.self), for: indexPath) as? DoctorHomeTimerCell else{ return UITableViewCell() }
            
            switch indexPath.row {
            case 0:
                cell.imgicon.image = #imageLiteral(resourceName: "timer-1")
                cell.lblInfo.text = "Your next appointment schedule in".localiz()
            default:
                cell.imgicon.image = #imageLiteral(resourceName: "messages")
                cell.lblInfo.text = "Your next Message schedule in".localiz()
            }
            
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorHomeCell.self), for: indexPath) as? DoctorHomeCell else{ return UITableViewCell() }
            
            cell.lblTitle.text = self.appointment[indexPath.row]
            cell.imgCourse.image = self.imgArr[indexPath.row]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorHomeHeaderCell") as? DoctorHomeHeaderCell else{ return UITableViewCell() }
            
            let docProfile = UserData.returnCodableData(for: .UserProfileData, valueType: UserDetails.self)
            cell.lblDoctorName.text = docProfile?.fullName ?? ""
            cell.lblDoctorLevel.text = "Level" + " 3"
            return cell.contentView
        }else{
            return UIView()
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        
    }
}

