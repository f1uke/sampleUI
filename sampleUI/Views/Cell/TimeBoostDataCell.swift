//
//  TimeBoostDataCell.swift
//  sampleUI
//
//  Created by Sattra on 9/21/21.
//

import UIKit

class TimeBoostDataCell: UITableViewCell {
    
    static let cellId = "TimeBoostDataCell"
    @IBOutlet weak var timeLabel: UILabel!
    
    var onDelete: ( (Int) -> Void )?
    var index: Int?
    var data: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(index: Int, data: Date, onDelete: ( (Int) -> Void )?) {
        self.onDelete = onDelete
        self.data = data
        self.index = index
        
        timeLabel.text = AppUtils.dateToString(date: data, pattern: .time )
    }

    @IBAction func deletePressed(_ sender: Any) {
        onDelete?(index!)
    }
}
