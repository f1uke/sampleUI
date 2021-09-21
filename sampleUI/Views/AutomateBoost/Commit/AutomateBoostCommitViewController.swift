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
    
    var viewModel: AutomateBoostViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
