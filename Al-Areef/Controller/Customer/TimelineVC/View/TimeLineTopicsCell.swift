//
//  TimeLineTopicsCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class TimeLineTopicsCell: UITableViewCell {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var lblTitle         : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        DispatchQueue.main.async(execute: {
            self.collectionView.reloadData()
        })
    }

}
