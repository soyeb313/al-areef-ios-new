//
//  WorkScheduleDayCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 24/05/21.
//

import UIKit

class WorkScheduleDayCell: UITableViewCell {

    @IBOutlet weak var collectionView:DynamicHeightCollectionView!
    
    @IBOutlet weak var lblTitle         : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTitle.text = "Select Days".localiz()
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
