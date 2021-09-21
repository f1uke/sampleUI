//
//  AutomateBoostCommitViewController.swift
//  sampleUI
//
//  Created by Sattra on 9/21/21.
//

import UIKit
import TTGTags

class AutomateBoostCommitViewController: UIViewController {
    
    class func initial(viewModel: AutomateBoostViewModel?) -> AutomateBoostCommitViewController {
        let vc = Storyboards.automateBoostComit.storyboard.instantiateViewController(withIdentifier: Storyboards.automateBoostComit.automateBoostCommitVC) as! AutomateBoostCommitViewController
        
        vc.viewModel = viewModel
        return vc
    }
    
    @IBOutlet weak var startEndDateLabel: UILabel!
    @IBOutlet weak var totalDayLabel: UILabel!
    @IBOutlet weak var dayTagView: UIView!
    @IBOutlet weak var dayTagViewHeigh: NSLayoutConstraint!
    @IBOutlet weak var timeTagView: UIView!
    @IBOutlet weak var timeTagViewHeigh: NSLayoutConstraint!
    
    var viewModel: AutomateBoostViewModel?
    
    var dayTagCollection: TTGTextTagCollectionView?
    var timeTagCollection: TTGTextTagCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        initTag()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkDateByDay()
        checkTime()
    }
    
    func initTag() {
        //day
        dayTagCollection = TTGTextTagCollectionView.init(frame: dayTagView.bounds)
        dayTagCollection!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dayTagCollection!.backgroundColor = .clear
        dayTagCollection!.enableTagSelection = false
        dayTagCollection!.scrollView.isScrollEnabled = false
        
        //time
        timeTagCollection = TTGTextTagCollectionView.init(frame: timeTagView.bounds)
        timeTagCollection!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        timeTagCollection!.backgroundColor = .clear
        timeTagCollection!.enableTagSelection = false
        timeTagCollection!.scrollView.isScrollEnabled = false
        
        self.dayTagView.addSubview(dayTagCollection!)
        self.timeTagView.addSubview(timeTagCollection!)
        
        dayTagViewHeigh.constant = dayTagCollection!.contentSize.height
        timeTagViewHeigh.constant = timeTagCollection!.contentSize.height
        self.view.layoutIfNeeded()
    }
    
    func addDayTag(label: String) {
        let content = TTGTextTagStringContent.init(text: label)
        content.textColor = UIColor.black
        content.textFont = AppFonts.KanitLight14!
        
        let normalStyle = TTGTextTagStyle.init()
        normalStyle.backgroundColor = UIColor.white
        normalStyle.extraSpace = CGSize.init(width: 8, height: 8)
        
        let selectedStyle = TTGTextTagStyle.init()
        selectedStyle.backgroundColor = UIColor.green
        selectedStyle.extraSpace = CGSize.init(width: 8, height: 8)
        
        let tag = TTGTextTag.init()
        tag.content = content
        tag.style = normalStyle
        tag.selectedStyle = selectedStyle
        
        dayTagCollection!.addTag(tag)
        
        dayTagCollection!.reload()
        print(dayTagCollection!.contentSize.height)
        dayTagViewHeigh.constant = dayTagCollection!.contentSize.height
        self.view.layoutIfNeeded()
    }
    
    func addTimeTag(label: String) {
        let content = TTGTextTagStringContent.init(text: label)
        content.textColor = UIColor.black
        content.textFont = AppFonts.KanitLight14!
        
        let normalStyle = TTGTextTagStyle.init()
        normalStyle.backgroundColor = UIColor.white
        normalStyle.extraSpace = CGSize.init(width: 8, height: 8)
        
        let selectedStyle = TTGTextTagStyle.init()
        selectedStyle.backgroundColor = UIColor.green
        selectedStyle.extraSpace = CGSize.init(width: 8, height: 8)
        
        let tag = TTGTextTag.init()
        tag.content = content
        tag.style = normalStyle
        tag.selectedStyle = selectedStyle
        
        timeTagCollection!.addTag(tag)
        
        timeTagCollection!.reload()
        print(timeTagCollection!.contentSize.height)
        timeTagViewHeigh.constant = timeTagCollection!.contentSize.height
        self.view.layoutIfNeeded()
    }
    
    func setupView() {
        let startDate = AppUtils.dateToString(date: viewModel?.startDate ?? Date(), pattern: .shortdmy, locale: LocaleDateTime.th)
        let endDate = AppUtils.dateToString(date: viewModel?.endDate ?? Date(), pattern: .shortdmy, locale: LocaleDateTime.th)
        startEndDateLabel.text = "\(startDate) - \(endDate)"
        totalDayLabel.text = "(ทั้งหมด \(AppUtils.totalDistance(_1st: viewModel?.startDate ?? Date(), _2nd: viewModel?.endDate ?? Date(), resultIn: .day) ?? 0) วัน ตลอดแคมเปญ)"
    }
    
    func checkDateByDay() {
        if viewModel!.sunday {
            let count = checkDate(weekday: 1, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("sunday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันอาทิตย์")
            } else {
                addDayTag(label: "ทุกวันอาทิตย์ x\(count)")
            }
        }
        if viewModel!.monday {
            let count = checkDate(weekday: 2, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("monday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันจันทร์")
            } else {
                addDayTag(label: "ทุกวันจันทร์ x\(count)")
            }
        }
        if viewModel!.tuesday {
            let count = checkDate(weekday: 3, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("tuesday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันอังคาร")
            } else {
                addDayTag(label: "ทุกวันอังคาร x\(count)")
            }
        }
        if viewModel!.wednesday {
            let count = checkDate(weekday: 4, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("wednesday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันพุท")
            } else {
                addDayTag(label: "ทุกวันพุท x\(count)")
            }
        }
        if viewModel!.thursday {
            let count = checkDate(weekday: 5, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("thursday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันพฤหัส")
            } else {
                addDayTag(label: "ทุกวันพฤหัส x\(count)")
            }
        }
        if viewModel!.friday {
            let count = checkDate(weekday: 6, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("friday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันศุกร์")
            } else {
                addDayTag(label: "ทุกวันศุกร์ x\(count)")
            }
        }
        if viewModel!.saturday {
            let count = checkDate(weekday: 7, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("saturday = \(count)")
            if count == 0 {
                addDayTag(label: "ทุกวันเสาร์")
            } else {
                addDayTag(label: "ทุกวันเสาร์ x\(count)")
            }
        }
    }
    
    func checkDate(weekday: Int, startDate: Date, endDate: Date) -> Int {
        // User selected weekdays (1 = Sunday, 7 = Saturday)
        let selectedWeekdays = [weekday]
        let calendar = Calendar.current
        var matchingDates = [Date]()
        
        // Finding matching dates at midnight - adjust as needed
        let components = DateComponents(hour: 0, minute: 0, second: 0) // midnight
        calendar.enumerateDates(startingAfter: startDate, matching: components, matchingPolicy: .nextTime) { (date, strict, stop) in
            if let date = date {
                if date <= endDate {
                    let weekDay = calendar.component(.weekday, from: date)
                    print(date, weekDay)
                    if selectedWeekdays.contains(weekDay) {
                        matchingDates.append(date)
                    }
                } else {
                    stop = true
                }
            }
        }
        print("Matching dates = \(matchingDates)")
        return matchingDates.count
    }
    
    func checkTime() {
        if viewModel?.selectTime != nil {
            for item in viewModel!.selectTime! {
                addTimeTag(label: AppUtils.dateToString(date: item, pattern: .time))
            }
        }
    }

    @IBAction func savePressed(_ sender: Any) {
        let vc = DialogViewController.initial(message: "เปิดใช้ Auto Boost สำเร็จ", onDismiss: {
            self.navigationController?.popViewController(animated: true)
        })
        self.present(vc, animated: true)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
