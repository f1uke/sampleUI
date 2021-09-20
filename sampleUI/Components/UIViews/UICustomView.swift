//
//  UICustomView.swift
//  FundRanking
//
//  Created by Sattra on 9/15/21.
//

import Foundation
import UIKit

@IBDesignable class UICustomView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = CGFloat(0.5) {
        didSet{
            layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.4 {
        didSet{
            layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 4) {
        didSet{
            layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
    
}
