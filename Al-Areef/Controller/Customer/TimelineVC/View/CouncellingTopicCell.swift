//
//  CouncellingTopicCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 17/05/21.
//

import UIKit

class CouncellingTopicCell: UITableViewCell {

    @IBOutlet weak var collectionView   :UICollectionView!
    @IBOutlet weak var lblTitle         : UILabel!
    @IBOutlet weak var lblAbout         : UILabel!
    @IBOutlet weak var lblDescription   : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.text = "Counselling Topics".localiz()
        lblAbout.text = "About".localiz()
        lblDescription.text = "The knower was born out of the need to treat the people who were born the knower out of the need to treat people with mental health challenges. The knower was born out of the need to treat people with mental health challenges. The knower was born out of the need to treat people with mental health challenges. Mental health challenges. The knowledgeable was born out of a need to treat people with mental health challenges. The knower was born out of a need to treat people with mental health challenges. The knowledgeable was born out of a need to treat people with mental health challenges.".localiz()
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
