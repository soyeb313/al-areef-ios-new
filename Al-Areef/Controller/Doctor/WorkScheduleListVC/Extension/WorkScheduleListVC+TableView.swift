//
//  WorkScheduleListVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 23/05/21.
//

import UIKit

extension WorkScheduleListVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableViewDropDown == tableView {
            return 1
        }else{
            if viewWorkScheduleSegment.selectedIndex == 0 {
                return self.workScheduleList?.data?.regularWorkSchedule?.count ?? 0
            }else{
                return self.workScheduleList?.data?.occasionalWorkSchedule?.count ?? 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewDropDown == tableView {
            return dataSource.count
        }else{
            if workScheduleSegment.selectedSegmentIndex == 0 {
                return 2
            }else{
                return 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableViewDropDown == tableView {
            return CGFloat.leastNonzeroMagnitude
        }else{
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableViewDropDown == tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = dataSource[indexPath.row]
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleListCell.self), for: indexPath) as? WorkScheduleListCell else{ return UITableViewCell() }
            
            if workScheduleSegment.selectedSegmentIndex == 0 {
                let morningStartTime = self.workScheduleList?.data?.regularWorkSchedule?[indexPath.section].morningStartTime ?? "NA"
                
                let morningEndTime = self.workScheduleList?.data?.regularWorkSchedule?[indexPath.section].morningEndTime ?? "NA"
                
                let eveningStartTime = self.workScheduleList?.data?.regularWorkSchedule?[indexPath.section].eveningStartTime ?? "NA"
                
                let eveningEndTime = self.workScheduleList?.data?.regularWorkSchedule?[indexPath.section].eveningEndTime ?? "NA"
                switch indexPath.row {
                case 0:
                    cell.lblTitle.text = morningStartTime + " - " + morningEndTime
                default:
                    cell.lblTitle.text = eveningStartTime + " - " + eveningEndTime
                }
                
            }else{
                let startTime = self.workScheduleList?.data?.occasionalWorkSchedule?[indexPath.section].startTime ?? "NA"
                let endTime = self.workScheduleList?.data?.occasionalWorkSchedule?[indexPath.section].endTime ?? "NA"
                cell.lblTitle.text = startTime + " - " + endTime
            }
            cell.btnTrash.setImage(#imageLiteral(resourceName: "greentrash"), for: .normal)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableViewDropDown == tableView {
            return UIView()
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkScheduleListCell") as? WorkScheduleListCell else{ return UITableViewCell() }
            cell.btnTrash.setImage(#imageLiteral(resourceName: "whitetrash"), for: .normal)
            cell.vwBack.backgroundColor = .app_DarkGray
            cell.lblTitle.textColor = .white
            
            if workScheduleSegment.selectedSegmentIndex == 0 {
                cell.lblTitle.text = self.workScheduleList?.data?.regularWorkSchedule?[section].day
            }else{
                let startDate = self.workScheduleList?.data?.occasionalWorkSchedule?[section].startDate ?? "NA"
                let endDate = self.workScheduleList?.data?.occasionalWorkSchedule?[section].endDate ?? "NA"
                cell.lblTitle.text = startDate + " - " + endDate
            }
            
            return cell.contentView
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        
        if tableViewDropDown == tableView {
            removeTransparentView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if self.dataSource[indexPath.row] == "Add Regular Schedule" {
                    self.pushWorkScheduleVC(true)
                }else{
                    self.pushWorkScheduleVC(false)
                }
                
            }
        }
    }
}

