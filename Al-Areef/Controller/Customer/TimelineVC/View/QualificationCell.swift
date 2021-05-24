//
//  QualificationCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class QualificationCell: UITableViewCell {

    @IBOutlet weak var collectionView:DynamicHeightCollectionView!
    @IBOutlet weak var vwBack               : UIView!
    @IBOutlet weak var lblTitle         : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vwBack.setCornerRadius(radius: 5)
        self.vwBack.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        //collectionView.tag = row
        collectionView.reloadData()
    }
    
    func collectionReloadData(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.reloadData()
            self.collectionView.layoutIfNeeded()
        }
    }
}
