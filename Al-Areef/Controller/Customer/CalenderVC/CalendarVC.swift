//
//  CalenderVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 10/05/21.
//

import UIKit
import FSCalendar

protocol SelectDateProtocol: class {
    func selectedDate(_ tag : Int,dateStr : String)
}

class CalendarVC: UIViewController, FSCalendarDelegate {

    // MARK:- Outlets
    @IBOutlet weak var calendar            : FSCalendar!
    
    var consultType : ConsultingType?
    weak var selectDateProtocol: SelectDateProtocol?
    var tag = 0
    private var currentPage: Date?

    private lazy var today: Date = {
        return Date()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.view.isOpaque = false
        
        calendar.scope = .month
        calendar.appearance.headerTitleColor = .white
        calendar.calendarHeaderView.backgroundColor = .app_DarkGray
        calendar.setCornerRadius(radius: 5)
        self.calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        self.calendar.appearance.weekdayTextColor = UIColor.app_Green
        self.calendar.setShadow(shadowColor: UIColor.gray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            calendar.locale = Locale(identifier: lang)
        }else{
            calendar.locale = Locale(identifier: "en")
        }
        
        calendar.delegate = self
        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBActions
    @IBAction func dismissVC(_ sender: UIButton) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func monthForthButtonPressed(_ sender: Any) {
            
        self.moveCurrentPage(moveUp: true)
    }
        
    @IBAction func monthBackButtonPressed(_ sender: Any) {
        self.moveCurrentPage(moveUp: false)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
             print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        let dateStr = dateFormatter.string(from: date)
        
        self.dismiss(animated: false, completion: nil)
        self.selectDateProtocol?.selectedDate(self.tag, dateStr: dateStr)
     
    }

    private func moveCurrentPage(moveUp: Bool) {
            
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = moveUp ? 1 : -1
        
        self.currentPage = calendar.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendar.setCurrentPage(self.currentPage!, animated: true)
    }
}
