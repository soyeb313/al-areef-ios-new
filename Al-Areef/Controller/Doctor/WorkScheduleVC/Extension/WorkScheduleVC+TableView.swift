//
//  WorkScheduleVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/05/21.
//

import UIKit

extension WorkScheduleVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WorkScheduleArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch WorkScheduleArr[indexPath.row] {
        case .title:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleTitleCell.self), for: indexPath) as? WorkScheduleTitleCell else{ return UITableViewCell() }
            
            if isRegular {
                cell.lblTitle.text = "Add Regular Schedule".localiz()
            }else{
                cell.lblTitle.text = "Add Occasional Schedule".localiz()
            }
            
            return cell
        case .day :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleDayCell.self), for: indexPath) as? WorkScheduleDayCell else{ return UITableViewCell() }
           // cell.lblTitle.text = qualifications[indexPath.row]
            cell.collectionView.tag = 1
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            cell.updateConstraints()
            return cell
        case .morningTime,.eveningTime :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleTimeCell.self), for: indexPath) as? WorkScheduleTimeCell else{ return UITableViewCell() }
            switch WorkScheduleArr[indexPath.row] {
            case .morningTime :
                cell.lblTitle.text = "Evening Hours".localiz()
                cell.btnTimeSelect.tag = 0
            default :
                cell.lblTitle.text = "Morning Hours".localiz()
                cell.btnTimeSelect.tag = 1
            }
            return cell
        case .WorkScheduleDate :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleDateCell.self), for: indexPath) as? WorkScheduleDateCell else{ return UITableViewCell() }
            if self.startDate == ""{
                cell.lblStartDate.text = "Start Date".localiz()
            }else{
                cell.lblStartDate.text = startDate
            }
            
            if self.endDate == ""{
                cell.lblEndDate.text = "End Date".localiz()
            }else{
                cell.lblEndDate.text = endDate
            }
            
            return cell
        case .WorkScheduleAvailability :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkScheduleAvailablityCell.self), for: indexPath) as? WorkScheduleAvailablityCell else{ return UITableViewCell() }
            cell.availabiltyText.placeholder = "Select Status".localized
            cell.availabiltyText.optionArray = self.availabilityArr
            
                    cell.availabiltyText.arrowColor = UIColor.app_DarkGray
                    cell.availabiltyText.selectedRowColor = UIColor.app_Green
                
                    cell.availabiltyText.didSelect { (str, i, id) in
                        if str == "Partial Available".localiz(){
                            self.WorkScheduleArr = [WorkSchedule.title,WorkSchedule.WorkScheduleDate,WorkSchedule.WorkScheduleAvailability,WorkSchedule.morningTime,WorkSchedule.eveningTime]
                        }else{
                            self.WorkScheduleArr = [WorkSchedule.title,WorkSchedule.WorkScheduleDate,WorkSchedule.WorkScheduleAvailability,WorkSchedule.reason]
                        }
                        self.tableView.reloadData()
                    }
            return cell
        case .reason :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UnavailabilityReasonCell.self), for: indexPath) as? UnavailabilityReasonCell else{ return UITableViewCell() }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkScheduleSaveCell") as? WorkScheduleSaveCell else{ return UITableViewCell() }
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
