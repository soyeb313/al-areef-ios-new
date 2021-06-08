//
//  VoiceMessageVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 19/05/21.
//

import UIKit
import iRecordView
import Alamofire
import SVProgressHUD
import Loaf
import AVFoundation
class VoiceMessageVC: UIViewController, MainTimeofPlayer {
    
   
    func sendttimer(intreval1: TimeInterval, tim1e: String) {
        
        if tim1e == "00:\(wordCount):00" {
            self.audioManager.stopRecording()
            recordView.onFinish(recordButton: recordButton)
        }
    }
     var fileManager: AGFileManager?
    
    var progressValue : Float = 0
    var timer : Timer?
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var viewPreview: UIView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imgPlaceholder: UIImageView!
    @IBOutlet weak var tblChat: UITableView!
    var messages = [Message]()
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOnline: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var viewRecord: UIView!
    var words = ""
    var rate = ""
    var couslingTopic_name =  ""
    var couslingTopic_id =  0
    var consultant_id  =  0
   var name = ""
    var wordCount = 0
    let recordView = RecordView()
    let recordButton = RecordButton()
    let audioManager: AGManager = AGManager(withFileManager: AGFileManager(withFileName: nil) )
    var isResuem = false
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = name
        imgPlaceholder.image = #imageLiteral(resourceName: "doctor")
        imgPlaceholder.layer.cornerRadius = imgPlaceholder.frame.size.width/2
        imgPlaceholder.layer.masksToBounds = true
        self.viewPreview.isHidden = true
        SetButtonView()
        setupTable()
        self.txtMsg.placeholder = "Record your voice".localiz()
       
    }
    func setupTable() {
       // txtMsg.delegate = self
        // config tableView
        tblChat.rowHeight = UITableView.automaticDimension
        tblChat.dataSource = self
        tblChat.backgroundColor = UIColor(hexString: "F0FFFA")
        tblChat.tableFooterView = UIView()
        // cell setup
        tblChat.register(UINib(nibName: "RightViewCell", bundle: nil), forCellReuseIdentifier: "RightViewCell")
        tblChat.register(UINib(nibName: "LeftViewCell", bundle: nil), forCellReuseIdentifier: "LeftViewCell")
        tblChat.register(UINib(nibName: "VoiceRightTableViewCell", bundle: nil), forCellReuseIdentifier: "VoiceRightTableViewCell")
        tblChat.register(UINib(nibName: "VoiceLeftTableViewCell", bundle: nil), forCellReuseIdentifier: "VoiceLeftTableViewCell")

        let strArr = words.split(separator: " ")

        for item in strArr {
            let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            if let intVal = Int(part) {
                wordCount = intVal
            }
        }
        
        GetTrail()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.audioManager.stopRecording()
        self.audioManager.stopPlaying()
        audioManager.newRecoding(fileManager: AGFileManager(withFileName: nil))
    }
    func SetButtonView() {
       
         recordButton.translatesAutoresizingMaskIntoConstraints = false

        
         recordView.translatesAutoresizingMaskIntoConstraints = false

        viewRecord.addSubview(recordButton)
        viewRecord.addSubview(recordView)

         recordButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
         recordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

         recordButton.trailingAnchor.constraint(equalTo: viewRecord.trailingAnchor, constant: -15).isActive = true
         recordButton.bottomAnchor.constraint(equalTo: viewRecord.bottomAnchor, constant: -16).isActive = true


         recordView.trailingAnchor.constraint(equalTo: recordButton.leadingAnchor, constant: -25).isActive = true
         recordView.leadingAnchor.constraint(equalTo: viewRecord.leadingAnchor, constant: 10).isActive = true
         recordView.bottomAnchor.constraint(equalTo: recordButton.bottomAnchor,constant: -15).isActive = true
        
        recordButton.setImage(#imageLiteral(resourceName: "microphone"), for: .normal)
        recordButton.recordView = recordView
        recordView.delegate = self
        recordButton.listenForRecord = true
        recordView.offset = 20
        audioManager.delegate = self
        audioManager.checkRecordPermission()
        audioManager.timerdelegt = self
        
        let strArr = words.split(separator: " ")

        for item in strArr {
            let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            if let intVal = Int(part) {
                wordCount = intVal
            }
        }
        
        progressView.progress = 1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSend(_ sender : UIButton){
        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PopupVoiceTextVC.self)) as? PopupVoiceTextVC else { return }
        vc.isFromVoice = true
        self.navigationController?.pushViewController(vc, animated: false)
    }

    @IBAction func btnPlay(_ sender: Any) {
        
        if !self.audioManager.isPlaying {
            self.audioManager.startPalyer()
        } else {
            
            self.audioManager.resumePalyer()
        }
    }
    @IBAction func btnDelete(_ sender: Any) {
        self.viewRecord.isHidden = false
        self.viewPreview.isHidden = true
        audioManager.newRecoding(fileManager: AGFileManager(withFileName: nil))
       
    }
    @IBAction func btnSend1(_ sender: Any) {
        if self.audioManager.isPlaying {
            
        }else{
            SVProgressHUD.show()
            UploadVoiceRecord()
        }
        
    }
    
    func UploadVoiceRecord() {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        let user_id =   UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? ""
        
      
        let FileURL =   documentsDirectory.appendingPathComponent(UserDefaults.standard.value(forKey: "URL") as! String)
        Alamofire.upload(multipartFormData: { multipart in
            guard let audioFile: Data = try? Data (contentsOf: FileURL) else {return}

           // multipart.append( (FileURL), withName: "voice_file")
            multipart.append(audioFile, withName: "voice_file", fileName: FileURL.lastPathComponent, mimeType: "audio/m4a")
            multipart.append((user_id as! String).data(using: .utf8)!, withName :"user_id")
            multipart.append(("\(self.couslingTopic_id)").data(using: .utf8)!, withName :"service_id")
            multipart.append(("\(self.wordCount)").data(using: .utf8)!, withName :"no_words")
            multipart.append((self.rate).data(using: .utf8)!, withName :"amount")
            multipart.append(("\(self.consultant_id)").data(using: .utf8)!, withName :"consultant_id")
            multipart.append(("\(12314234)").data(using: .utf8)!, withName :"payment_id")
            multipart.append(("en").data(using: .utf8)!, withName :"lang")
        }, to: "http://alarif.itindiatechnology.in/api/ws-place-voice-service", method: .post, headers: nil) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.response { answer in
                    print("statusCode: \(answer.response?.statusCode ?? 0)")
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                        self.viewRecord.isHidden = false
                        self.viewPreview.isHidden = true
                        self.audioManager.newRecoding(fileManager: AGFileManager(withFileName: nil))
                        self.audioManager.stopPlaying()
                        self.audioManager.stopRecording()
                        guard let vc = UIStoryboard.DashBoardCustomer.instantiateViewController(withIdentifier: String(describing: PopupVoiceTextVC.self)) as? PopupVoiceTextVC else { return }
                        vc.name = self.name
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                }
                upload.uploadProgress { progress in
                    //call progress callback here if you need it
                }
            case .failure(let encodingError):
                print("multipart upload encodingError: \(encodingError)")
            }
        }
    }
}




extension VoiceMessageVC : RecordViewDelegate
{
    func onStart() {
    
        if !self.audioManager.isRecording {
            if isResuem == true {
                self.audioManager.resumeRecording()
                isResuem = false
            }else{
            self.audioManager.recordStart()
        }
        } else {
            isResuem = true
            
            self.audioManager.pauseRecording()
        }
    }
    
    func onCancel() {
        self.audioManager.stopRecording()
        audioManager.newRecoding(fileManager: AGFileManager(withFileName: nil))
    }
    
    func onFinished(duration: CGFloat) {
        if !self.audioManager.isRecording {
            if isResuem == true {
                self.audioManager.resumeRecording()
                isResuem = false
            }else{
            self.audioManager.recordStart()
        }
        } else {
            isResuem = true
            
            self.audioManager.pauseRecording()
        }

        
    }
    
    
}



extension VoiceMessageVC: AGManagerDelegate {
   
    
    func recorderAndPlayer(_ manager: AGManager, withStates state: AGManagerState) {
    
        switch state {
        case .undetermined:
            break
            
        case .granted:
//            btnRecord.setTitle("Initialize Recorder", for: .normal)
//            btnPlayer.setTitle("Initialize Player", for: .normal)
//            btnRecord.isEnabled = true
//            btnPlayer.isEnabled = false
            print("record..")
            
        case .denied:
            break
            
        case .error(let erro):
            print(erro.localizedDescription)
        }
    }
    
    func recorderAndPlayer(_ recoder: AGAudioRecorder, withStates state: AGRecorderState) {
        
        
        switch state {
        case .prepareToRecord:
//            btnRecord.setTitle("Ready to record", for: .normal)
//            btnPlayer.setTitle("Ready to Play", for: .normal)
//            btnRecord.isEnabled = true
//            btnPlayer.isEnabled = false
            let totalcount = wordCount*60

            recoder.duration1 = totalcount
                print("record..")
            
        case .recording:
//            btnRecord.setTitle("Recording....", for: .normal)
//            btnPlayer.isEnabled = false
            print("record..")
        case .pause:
            //btnRecord.setTitle("Pause recording", for: .normal)
            print("pause..")
        case .stop:
            //btnRecord.setTitle("Stop recording", for: .normal)
            print("stop..")
        case .finish:
           // btnRecord.setTitle("Recording Finish", for: .normal)
            self.viewRecord.isHidden = true
            self.viewPreview.isHidden = false

            print("finsh..")
        case .failed(let error):
//            btnRecord.setTitle(error.localizedDescription, for: .normal)
//            btnPlayer.isEnabled = false
          //  btnRecord.isEnabled = false
            print("error..")
        }
    }
    
    func recorderAndPlayer(_ player: AGAudioPlayer, withStates state: AGPlayerState){
        
        switch state {
        case .prepareToPlay:
          //  btnPlayer.setTitle("Ready to Play", for: .normal)
          //  btnRecord.isEnabled = false
           // btnPlayer.isEnabled = trues
            //player.scheduleTimer(progrssBar: self.progressView)
            print("play..")
        case .play:
            //btnPlayer.setTitle("Playing", for: .normal)
            print("play..")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)

        case .pause:
            //btnPlayer.setTitle("Pause Playing", for: .normal)
            print("pause..")

        case .stop:
            ///btnPlayer.setTitle("Stop Playing", for: .normal)
            print("stop..")
        case .finish:
           // btnPlayer.setTitle("Play again", for: .normal)
            print("finish..")
            timer?.invalidate()
        case .failed(let error):
            print(error.localizedDescription)
            timer?.invalidate()
//            btnRecord.setTitle(error.localizedDescription, for: .normal)
//            btnPlayer.isEnabled = false
//            btnRecord.isEnabled = false
        }
    }
    @objc func update(){
        if (progressValue < 1)
        {
            progressValue += 0.1
            progressView.progress = progressValue
        }
        else
        {
            timer?.invalidate()
            timer = nil
        }
    }
    func audioRecorderTime(currentTimetimeInterval: TimeInterval, formattedString: String) {
       
    }
   
    
}


extension VoiceMessageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        if message.side == .left {
            if message.text == ""
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceLeftTableViewCell") as! VoiceLeftTableViewCell
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.addTarget(self, action: #selector( btnPlay1), for: .touchUpInside)
                return cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftViewCell") as! LeftViewCell
            cell.configureCell(message: message)
            return cell
        }
        }
        else {
            if message.text == ""
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceRightTableViewCell") as! VoiceRightTableViewCell
                cell.btnPlay.tag = indexPath.row
                cell.configureCell(url: message.voice_file)
                cell.btnPlay.tag = indexPath.row
                cell.btnPlay.addTarget(self, action: #selector( btnPlay1), for: .touchUpInside)
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RightViewCell") as! RightViewCell
                cell.configureCell(message: message)
                return cell
        }
           
        }
    }
    
    @objc func btnPlay1(_ sender : UIButton){
       
        }
    
    func GetTrail() {
        let parameters = [ "user_id": UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) ?? "","consultant_id":consultant_id,
                           "lang": "en"
                          ] as [String : Any]
        let url = WSRequest.Gettrail()
        WebServiceHandler.sharedInstance.postWebService(URL: url, paramDict: parameters, Header: nil, viewController: self) { (responseDict,err) in
            print(responseDict,err)
            SVProgressHUD.dismiss()
            if let result = responseDict["message"] as? String
            {
                if result == "success"  {
                    let message = "\(String(describing:result))"
                    print(message)
                    DispatchQueue.main.async {
                        let data  = responseDict["data"] as! NSArray
                        
                        for obj in data
                        {
                            if let dict = obj as? NSDictionary
                            {
                                if dict["user_id"] as? String == UserDefaults.standard.value(forKey: User_defaults_Constants.user_id) as? String
                                {
                                   // self.messages.append((Message(text: dict["text_message"] as? String ?? "", side: .right)))
                                    self.messages.append(Message(text: dict["text_message"] as? String ?? "",voice_file: dict["voice_file"] as? String ?? "", side: .right))
                                    
                                }else
                                {
                                   
                                    self.messages.append(Message(text: dict["text_message"] as? String ?? "",voice_file: dict["voice_file"] as? String ?? "", side: .left))
                                }
                            }
                            
                        }
                        
                        self.tblChat.reloadData()
                        if self.messages.count == 0
                        {
                            self.tblChat.reloadData()
                        }else{
                        let indexpath = IndexPath(row: self.messages.count - 1, section: 0)
                        self.tblChat.scrollToRow(at: indexpath, at: .bottom, animated: true)
                    }
                        
                    }
                }else{
                    Loaf(responseDict["message"] as? String ?? ""
                         , state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "FF0000"), icon: UIImage(named: "toast_alert"))), location: .top, sender: self).show()
                }
               
            }
           
        }

    }
}
