//
//  TimelineVC+TableView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

extension TimelineVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return qualifications.count
        case 3:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTimelineCell.self), for: indexPath) as? ProfileTimelineCell else{ return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CouncellingTopicCell.self), for: indexPath) as? CouncellingTopicCell else{ return UITableViewCell() }
            cell.collectionView.tag = 0
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.collectionReloadData()
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QualificationCell.self), for: indexPath) as? QualificationCell else{ return UITableViewCell() }
            cell.lblTitle.text = qualifications[indexPath.row]
            cell.collectionView.tag = 1
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()

            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TimeLineTopicsCell.self), for: indexPath) as? TimeLineTopicsCell else{ return UITableViewCell() }
            cell.lblTitle.text = courses[indexPath.row]
            cell.collectionView.tag = 2
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.collectionReloadData()
//            DispatchQueue.main.async {
//                cell.setNeedsLayout()
//                cell.updateConstraintsIfNeeded()
//            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
