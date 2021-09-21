//
//  AutomateBoostCommitViewController.swift
//  sampleUI
//
//  Created by Sattra on 9/21/21.
//

import UIKit

class AutomateBoostCommitViewController: UIViewController {
    
    class func initial(viewModel: AutomateBoostViewModel?) -> AutomateBoostCommitViewController {
        let vc = Storyboards.automateBoostComit.storyboard.instantiateViewController(withIdentifier: Storyboards.automateBoostComit.automateBoostCommitVC) as! AutomateBoostCommitViewController
        
        vc.viewModel = viewModel
        return vc
    }
    
    @IBOutlet weak var startEndDateLabel: UILabel!
    @IBOutlet weak var totalDayLabel: UILabel!
    
    var viewModel: AutomateBoostViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        checkDateByDay()
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
        }
        if viewModel!.monday {
            let count = checkDate(weekday: 2, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("monday = \(count)")
        }
        if viewModel!.tuesday {
            let count = checkDate(weekday: 3, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("tuesday = \(count)")
        }
        if viewModel!.wednesday {
            let count = checkDate(weekday: 4, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("wednesday = \(count)")
        }
        if viewModel!.thursday {
            let count = checkDate(weekday: 5, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("thursday = \(count)")
        }
        if viewModel!.friday {
            let count = checkDate(weekday: 6, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("friday = \(count)")
        }
        if viewModel!.saturday {
            let count = checkDate(weekday: 7, startDate: viewModel?.startDate ?? Date(), endDate: viewModel?.endDate ?? Date())
            print("saturday = \(count)")
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

    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
