//
//  ViewController.swift
//  sampleUI
//
//  Created by Sattra on 9/20/21.
//

import UIKit

class AutomateBoost: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeigh: NSLayoutConstraint!
    
    @IBOutlet weak var startDateEdt: UITextField!
    @IBOutlet weak var endDateEdt: UITextField!
    
    @IBOutlet weak var sundayImg: UIImageView!
    @IBOutlet weak var mondayImg: UIImageView!
    @IBOutlet weak var tuesdayImg: UIImageView!
    @IBOutlet weak var wednesdayImg: UIImageView!
    @IBOutlet weak var thursdayImg: UIImageView!
    @IBOutlet weak var fridayImg: UIImageView!
    @IBOutlet weak var saturdayImg: UIImageView!
    
    
    let datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    var timeToolBar = UIToolbar()
    
    lazy var viewModel: AutomateBoostViewModel = {
        return AutomateBoostViewModel(onErrorResponse: self.onErrorResponse)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        setupSelectTime()
    }
    
    private func onErrorResponse(_ message: String) {
        //todo
    }
    
    private func setupSelectTime() {
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.autoresizingMask = .flexibleWidth
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        timeToolBar.translatesAutoresizingMaskIntoConstraints = false
        timeToolBar.barStyle = .default
        timeToolBar.items = [UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneSelectTimeClicked))]
        timeToolBar.sizeToFit()
    }
    
    func createStartDateToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let donBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneStartDatePressed))
        toolBar.setItems([donBtn], animated: true)
        return toolBar
    }
    
    func createEndDateToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let donBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneEndDatePressed))
        toolBar.setItems([donBtn], animated: true)
        return toolBar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        startDateEdt.inputView = datePicker
        startDateEdt.inputAccessoryView = createStartDateToolbar()
        endDateEdt.inputView = datePicker
        endDateEdt.inputAccessoryView = createEndDateToolbar()
    }
    
    @objc func doneStartDatePressed() {
        startDateEdt.text = AppUtils.dateToString(date: datePicker.date, pattern: .dmy, locale: LocaleDateTime.th)
        viewModel.startDate = datePicker.date
        view.endEditing(true)
    }
    
    @objc func doneEndDatePressed() {
        endDateEdt.text = AppUtils.dateToString(date: datePicker.date, pattern: .dmy, locale: LocaleDateTime.th)
        viewModel.endDate = datePicker.date
        view.endEditing(true)
    }
    
    func changeImageCheckbox() {
        sundayImg.image = viewModel.sunday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        mondayImg.image = viewModel.monday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        tuesdayImg.image = viewModel.tuesday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        wednesdayImg.image = viewModel.wednesday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        thursdayImg.image = viewModel.thursday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        fridayImg.image = viewModel.friday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
        saturdayImg.image = viewModel.saturday ? #imageLiteral(resourceName: "search_checkbox_checked") : #imageLiteral(resourceName: "search_checkbox")
    }
    
    //ib
    @IBAction func sundayPressed(_ sender: Any) {
        viewModel.sunday = !viewModel.sunday
        changeImageCheckbox()
    }
    @IBAction func mondayPressed(_ sender: Any) {
        viewModel.monday = !viewModel.monday
        changeImageCheckbox()
    }
    @IBAction func tuesdayPressed(_ sender: Any) {
        viewModel.tuesday = !viewModel.tuesday
        changeImageCheckbox()
    }
    @IBAction func wednesdayPressed(_ sender: Any) {
        viewModel.wednesday = !viewModel.wednesday
        changeImageCheckbox()
    }
    @IBAction func thursdayPressed(_ sender: Any) {
        viewModel.thursday = !viewModel.thursday
        changeImageCheckbox()
    }
    @IBAction func fridayPressed(_ sender: Any) {
        viewModel.friday = !viewModel.friday
        changeImageCheckbox()
    }
    @IBAction func saturdayPressed(_ sender: Any) {
        viewModel.saturday = !viewModel.saturday
        changeImageCheckbox()
    }
    @IBAction func selectAllPressed(_ sender: Any) {
        viewModel.sunday = true
        viewModel.monday = true
        viewModel.tuesday = true
        viewModel.wednesday = true
        viewModel.thursday = true
        viewModel.friday = true
        viewModel.saturday = true
        changeImageCheckbox()
    }
    
    @objc func onDoneSelectTimeClicked() {
        if viewModel.selectTime == nil {
            viewModel.selectTime = []
        }
        viewModel.selectTime?.append(timePicker.date)
        self.tableView.reloadData()
        
        let itemCount = viewModel.selectTime?.count ?? 1
        self.tableViewHeigh.constant = self.tableView.contentSize.height + CGFloat((8 * itemCount))
        self.view.layoutIfNeeded()
        
        timeToolBar.removeFromSuperview()
        timePicker.removeFromSuperview()
    }
    
}

extension AutomateBoost: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.selectTime == nil {
            return 1
        } else {
            return viewModel.selectTime!.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.selectTime == nil || viewModel.selectTime!.isEmpty {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: TimeBoostCell.cellId) as! TimeBoostCell
            cell.selectionStyle = .none
            return cell
        } else {
            if indexPath.row == viewModel.selectTime?.count {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: TimeBoostCell.cellId) as! TimeBoostCell
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: TimeBoostDataCell.cellId) as! TimeBoostDataCell
                cell.selectionStyle = .none
                cell.setupView(index: indexPath.row, data: viewModel.selectTime![indexPath.row]) { index in
                    self.viewModel.selectTime?.remove(at: index)
                    self.tableView.reloadData()
                    let itemCount = self.viewModel.selectTime?.count ?? 1
                    self.tableViewHeigh.constant = self.tableView.contentSize.height + CGFloat((8 * itemCount))
                    self.view.layoutIfNeeded()
                }
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.selectTime == nil || viewModel.selectTime!.isEmpty || indexPath.row == viewModel.selectTime?.count {
            setupSelectTime()
            self.view.addSubview(self.timePicker)
            self.view.addSubview(self.timeToolBar)
            
            NSLayoutConstraint.activate([
                self.timePicker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.timePicker.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                self.timePicker.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                self.timePicker.heightAnchor.constraint(equalToConstant: 300)
            ])
            
            NSLayoutConstraint.activate([
                self.timeToolBar.bottomAnchor.constraint(equalTo: self.timePicker.topAnchor),
                self.timeToolBar.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                self.timeToolBar.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                self.timeToolBar.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    
}
