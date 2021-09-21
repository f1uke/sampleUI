//
//  AutomateBoostViewModel.swift
//  sampleUI
//
//  Created by Sattra on 9/21/21.
//

import Foundation

class AutomateBoostViewModel {
    
    init(onErrorResponse: ((String) -> Void)?) {
        self.onErrorResponse = onErrorResponse
    }
    
    let onErrorResponse: ((String) -> Void)?
    
    //select date
    var startDate: Date?
    var endDate: Date?
    
    //select day
    var sunday: Bool = false
    var monday: Bool = false
    var tuesday: Bool = false
    var wednesday: Bool = false
    var thursday: Bool = false
    var friday: Bool = false
    var saturday: Bool = false
    
}
