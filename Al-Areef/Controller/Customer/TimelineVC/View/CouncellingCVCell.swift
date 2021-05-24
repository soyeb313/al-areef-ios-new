//
//  CouncellingCVCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class CouncellingCVCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var vwBack : UIView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        vwBack.setCornerRadius(radius: 5)
        vwBack.setBorder(with: .app_Green, 1)
    }

    

}
