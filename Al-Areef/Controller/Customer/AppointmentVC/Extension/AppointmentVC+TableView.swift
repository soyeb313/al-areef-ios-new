//
//  AppointmentVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 18/05/21.
//

import Foundation
import UIKit

extension AppointmentVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 4
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
            return cell
        
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PreviousRecommendationsCell.self), for: indexPath) as? PreviousRecommendationsCell else{ return UITableViewCell() }
           
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
