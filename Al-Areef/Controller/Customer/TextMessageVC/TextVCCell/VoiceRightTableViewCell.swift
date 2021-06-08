//
//  VoiceRightTableViewCell.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 08/06/21.
//

import UIKit

class VoiceRightTableViewCell: UITableViewCell {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var progressview: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(url:String) {
      
        
    }
   
}
