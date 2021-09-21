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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension AutomateBoost: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TimeBoostCell.cellId) as! TimeBoostCell
        cell.selectionStyle = .none
        return cell
    }
    
    
}
