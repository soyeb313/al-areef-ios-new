//
//  SideMenuVC+TableView.swift
//  GPS_Columbia
//
//  Created by Shashikant's_Macmini on 08/10/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension For :- UITableViewDelegate
extension SideMenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch arrListing[indexPath.section] {
        case .Profile:
            break
//            onDidSelect?(arrListing[indexPath.row])
        case .ServicesInbox:
            isServicesInbox = !isServicesInbox
            if isServicesInbox {
                arrListing =
                    [.Profile,.Appointments,.ServicesInbox,.SubServicesInbox,.ManageCourses,.ConsultantTimeline,.Notifications,.ServedPatients,.WorkSchedule,.Prescription,.Wallet,.Logout]
                imgarr = [#imageLiteral(resourceName: "appointmentsicon"),#imageLiteral(resourceName: "servicesinbox"),#imageLiteral(resourceName: "servicesinbox"),#imageLiteral(resourceName: "managecourses"),#imageLiteral(resourceName: "consultanttimeline"),#imageLiteral(resourceName: "notifications"),#imageLiteral(resourceName: "servedPatients"),#imageLiteral(resourceName: "workschedule"),#imageLiteral(resourceName: "prescription"),#imageLiteral(resourceName: "walletWhite"),#imageLiteral(resourceName: "consultationfees")]
            }else{
                arrListing =
                    [.Profile,.Appointments,.ServicesInbox,.ManageCourses,.ConsultantTimeline,.Notifications,.ServedPatients,.WorkSchedule,.Prescription,.Wallet,.Logout]
                imgarr = [#imageLiteral(resourceName: "appointmentsicon"),#imageLiteral(resourceName: "servicesinbox"),#imageLiteral(resourceName: "managecourses"),#imageLiteral(resourceName: "consultanttimeline"),#imageLiteral(resourceName: "notifications"),#imageLiteral(resourceName: "servedPatients"),#imageLiteral(resourceName: "workschedule"),#imageLiteral(resourceName: "prescription"),#imageLiteral(resourceName: "walletWhite"),#imageLiteral(resourceName: "consultationfees")]
            }
            
            self.tableView.reloadData()
            
        case .Logout:
            self.dismiss(animated: false, completion: nil)
            onDidSelect?(arrListing[indexPath.section])
        default :
            self.dismiss(animated: false, completion: nil)
            onDidSelect?(arrListing[indexPath.section])
        }
    }
    
} //extension

// MARK:- Extension For :- UITableViewDataSource
extension SideMenuVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrListing.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch arrListing[section] {
        case .SubServicesInbox: return self.servicesInbox.count
        default : return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch arrListing[indexPath.section] {
        case .Profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuHeaderCell.self), for: indexPath) as? MenuHeaderCell else { return MenuHeaderCell() }
            cell.btnEditProfile.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
            cell.btnCloseProfile.addTarget(self, action: #selector(closeProfile), for: .touchUpInside)
           // cell.imgvProfile.setImage(str: self.profilePicModel?.profilePic ?? "")
            return cell
        case .SubServicesInbox :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubMenuContentCell.self), for: indexPath) as? SubMenuContentCell else { return SubMenuContentCell() }
            //self.servicesInbox
            cell.setContent(for: servicesInbox[indexPath.row], withBadge: Int.random(in: 0...100))
            cell.imgvIcon.image = self.imgSubarr[indexPath.row]
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuContentCell.self), for: indexPath) as? MenuContentCell else { return MenuContentCell() }
            cell.setContent(for: arrListing[indexPath.section], withBadge: Int.random(in: 0...100))
            cell.imgvIcon.image = self.imgarr[indexPath.section - 1 ]
            return cell
        }
    }
    
    @objc func updateProfile(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
        onDidSelect?(.Profile)
    }
    
    @objc func closeProfile(button: UIButton) {
        self.dismiss(animated: false, completion: nil)
        
    }
    
} //extension
