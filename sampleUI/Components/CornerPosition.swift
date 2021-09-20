//
//  CornerPosition.swift
//  iOS_spm.PD200102
//
//  Created by Wisanu Paunglumjeak on 13/1/2564 BE.
//

import Foundation
import UIKit

enum CornerPosition {
    case none
    case top
    case bot
    case left
    case right
    case topLeft
    case topRight
    case botLef
    case botRight
    case all
    case ignoreTopLeft
    case ignoreTopRight
    case ignoreBotLef
    case ignoreBotRight
    
    static func initWith(position: Int) -> Self{
        
        switch position {
        case 1:
            return .top
        case 2:
            return .bot
        case 3:
            return .left
        case 4:
            return .right
        case 5:
            return .topLeft
        case 6:
            return .topRight
        case 7:
            return .botLef
        case 8:
            return .botRight
        case 9:
            return .all
        case  10:
            return .ignoreTopLeft
        case  11:
            return .ignoreTopRight
        case  12:
            return .ignoreBotLef
        case  13:
            return .ignoreBotRight
        default:
            return .none
        }
    }
    
    var number: Int {
        switch self {
        case .top:
            return  1
        case .bot:
            return  2
        case .left:
            return  3
        case .right:
            return  4
        case .topLeft:
            return  5
        case .topRight:
            return  6
        case .botLef:
            return  7
        case .botRight:
            return  8
        case .all:
            return  9
        case .ignoreTopLeft:
            return 10
        case .ignoreTopRight:
            return 11
        case .ignoreBotLef:
            return 12
        case .ignoreBotRight:
            return 13
        case .none:
            return 0
        }
    }
    
    var mask: CACornerMask {
        switch self {
        case .none:
            return []
        case .top:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bot:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .left:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeft:
            return [.layerMinXMinYCorner]
        case .topRight:
            return [.layerMaxXMinYCorner]
        case .botLef:
            return [.layerMinXMaxYCorner]
        case .botRight:
            return [.layerMaxXMaxYCorner]
        case .all:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .ignoreTopLeft:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMaxXMinYCorner]
        case .ignoreTopRight:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,
                    .layerMinXMinYCorner]
        case .ignoreBotLef:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMaxXMaxYCorner]
        case .ignoreBotRight:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner]
        }
    }
}
