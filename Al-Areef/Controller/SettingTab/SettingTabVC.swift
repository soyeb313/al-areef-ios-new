//
//  SettingTabVC.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 10/04/21.
//

import UIKit

class SettingTabVC: UIViewController {

    @IBOutlet weak var tblSettings: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
    }
    private func setUpView() {
        self.tabBarController?.navigationItem.title = "Settings".localiz()
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.isNavigationBarHidden = false
        setUpView()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.navigationController?.isNavigationBarHidden = true

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SettingTabVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SetteingsTVC.self), for: indexPath) as? SetteingsTVC else{ return UITableViewCell() }
       
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.user_id, Value: "")
            Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.MobileNumber, Value: "")
            Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.full_name, Value: "")
            Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.city, Value: "")
            UserDefaults.standard.set(false, forKey: User_defaults_Constants.LOGGED_IN)
            UserDefaults.standard.synchronize()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
