//
//  DasBoardCustViewController.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 10/04/21.
//

import UIKit

class DasBoardCustViewController: UIViewController {

    @IBOutlet weak var tblServices: UITableView!
    @IBOutlet weak var btnViewappoinments: UIButton!
    
    var arrTitle = ["Consulting personal","Consulting comapanies", "Courses", "Al-Dhasal bank", "Ask us","Adviser","Who we are","Conatact Us"]
    var arrBtnTitle = ["The beginning","Hands", "The beginning", "Ask us", "The beginning","Better","Call","Show"]
    var arrImages : [UIImage] = [#imageLiteral(resourceName: "Image-1"),#imageLiteral(resourceName: "Image-2"),#imageLiteral(resourceName: "Image-3"),#imageLiteral(resourceName: "Image-4"),#imageLiteral(resourceName: "Image-2"),#imageLiteral(resourceName: "Image-6"),#imageLiteral(resourceName: "Image-5"),#imageLiteral(resourceName: "Image-7")]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnViewappoinments.layer.cornerRadius = 10
        self.btnViewappoinments.layer.masksToBounds = true
        self.btnViewappoinments.layer.borderWidth = 1
        self.btnViewappoinments.layer.borderColor = UIColor.white.cgColor
      
    }
    


}

extension DasBoardCustViewController : UITableViewDelegate, UITableViewDataSource
{
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"DashBoardTableViewCell", for: indexPath) as! DashBoardTableViewCell
        cell.lblTitleSertvice.text = arrTitle[indexPath.row]
        cell.btnAction.setTitle(arrBtnTitle[indexPath.row], for: .normal)
        cell.imgServices.image = arrImages[indexPath.row]
        cell.btnAction.layer.cornerRadius = 5
        cell.btnAction.layer.masksToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
