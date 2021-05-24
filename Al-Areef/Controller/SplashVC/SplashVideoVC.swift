//
//  SplashVideoVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 15/05/21.
//

import UIKit

class SplashVideoVC: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var imgVideo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.btnSkip.setTitle("Skip".localiz(), for: .normal)
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        pushLoginVC()
        
    }
    private func pushLoginVC() {
        // change the language

        appDelegate.setLogin()
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnPlay(_ sender: Any) {
        btnPlay.isHidden = true
        self.imgVideo.image = UIImage.gifImageWithName("ml_gif4")
    }
    
}
