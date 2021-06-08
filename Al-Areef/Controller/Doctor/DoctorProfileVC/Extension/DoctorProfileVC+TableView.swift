//
//  DoctorProfileVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

extension DoctorProfileVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedIndex {
        case 0:
            return doctorProfileOptions.count
        case 1:
            return sevice.count
        default:
            return area.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedIndex {
        case 0:
            switch doctorProfileOptions[indexPath.row] {
            case .HighestAcademicQualification:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorProfileCertificateCell.self), for: indexPath) as? DoctorProfileCertificateCell else{ return UITableViewCell() }
                return cell
            case .workExperience:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorProfileWorkExperinceCell.self), for: indexPath) as? DoctorProfileWorkExperinceCell else{ return UITableViewCell() }
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorProfileTextFldCell.self), for: indexPath) as? DoctorProfileTextFldCell else{ return UITableViewCell() }
                cell.lblTitle.text = self.doctorProfileOptions[indexPath.row].rawValue.localiz()
                return cell
            }
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoctorProfileSeviceAreasCell.self), for: indexPath) as? DoctorProfileSeviceAreasCell else{ return UITableViewCell() }
            switch selectedIndex {
            case 0:
                cell.lblTitle.text = "Sevice " + "\(indexPath.row + 1)"
                cell.lblName.text = sevice[indexPath.row]
            default:
                cell.lblTitle.text = "Area"
                cell.lblName.text = area[indexPath.row]
            }
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorProfileHeaderCell") as? DoctorProfileHeaderCell else{ return UITableViewCell() }
            cell.headerSegment.selectedSegmentIndex = self.selectedIndex
            return cell.contentView
        }else{
            return UIView()
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        
    }
}

