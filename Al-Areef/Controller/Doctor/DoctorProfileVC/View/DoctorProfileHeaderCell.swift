//
//  DoctorProfileHeaderCell.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 31/05/21.
//

import UIKit

class DoctorProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var headerSegment   : UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        headerSegment.setTitle("Personal".localiz(), forSegmentAt: 0)
        headerSegment.setTitle("Services".localiz(), forSegmentAt: 1)
        headerSegment.setTitle("Areas".localiz(), forSegmentAt: 2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
