//
//  WorkScheduleVC+CollectionView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/05/21.
//

import UIKit

extension WorkScheduleVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayArr.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WorkScheduleDayCVCell.self), for: indexPath) as? WorkScheduleDayCVCell else{return UICollectionViewCell()}
        cell.lblTitle.text = dayArr[indexPath.row]
        
        let regularSchedule = self.regularWorkShedule.filter({$0.day == dayArr[indexPath.row]})
        if regularSchedule.count > 0 {
            cell.imgCheck.image = #imageLiteral(resourceName: "check")
        }else{
            cell.imgCheck.image = #imageLiteral(resourceName: "uncheck")
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let regularSchedule = self.regularWorkShedule.filter({$0.day == dayArr[indexPath.row]})
        if regularSchedule.count > 0 {
            self.regularWorkShedule = self.regularWorkShedule.filter({$0.day != dayArr[indexPath.row]})
        }else{
            self.regularWorkShedule.append(RegularWorkShedule(day: dayArr[indexPath.row], morningTime: NingTime(startTime: "10:00 AM", endTime: "12:00 PM"), eveningTime: NingTime(startTime: "02:00 AM", endTime: "04:00 PM")))
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //let flag = self.itineraryTravelTypeModel.itineraryTravelTypes?[indexPath.item].isSelected ?? false
        //self.itineraryTravelTypeModel.itineraryTravelTypes?[indexPath.item].isSelected = !flag
    
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3), height: 50)
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
