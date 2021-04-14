//
//  InfoSliderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 12/04/21.
//

import UIKit

class InfoSliderCell: UICollectionViewCell {
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var lblInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(tutorial: Tutorial) {
        
        lblInfo.text = tutorial.detail
        
    }
}
