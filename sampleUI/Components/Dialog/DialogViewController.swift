//
//  DialogViewController.swift
//  sampleUI
//
//  Created by Sattra on 9/21/21.
//

import UIKit

class DialogViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    private var messageString: String?
    
    class func initial(message: String?) -> DialogViewController {
        let dialog = Storyboards.components.storyboard.instantiateViewController(withIdentifier: Storyboards.components.dialogVC) as! DialogViewController
        
        dialog.messageString = message
        dialog.modalTransitionStyle = .crossDissolve
        dialog.modalPresentationStyle = .overFullScreen
        return dialog
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        messageLabel.text = messageString
        delayDismiss()
    }
    
    private func delayDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
