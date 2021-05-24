//
//  TimelineVC+CollectionView.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

extension TimelineVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return consultTypeArr.count
        case 1:
            return 4
        default:
            return 2
        }
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CouncellingCVCell.self), for: indexPath) as? CouncellingCVCell else{return UICollectionViewCell()}
            cell.lblTitle.text = consultTypeArr[indexPath.row].rawValue.localiz()

            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: QualificationCVCell.self), for: indexPath) as? QualificationCVCell else{return UICollectionViewCell()}
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TimlineTopicsCVCell.self), for: indexPath) as? TimlineTopicsCVCell else{return UICollectionViewCell()}
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let flag = self.itineraryTravelTypeModel.itineraryTravelTypes?[indexPath.item].isSelected ?? false
        //self.itineraryTravelTypeModel.itineraryTravelTypes?[indexPath.item].isSelected = !flag
    
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 0:
            return CGSize(width: (collectionView.frame.width), height: 40)
        case 1:
            return CGSize(width: (collectionView.frame.width), height: 50)
            
        default:
            return CGSize(width: (collectionView.frame.width), height: 235)
        }
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
