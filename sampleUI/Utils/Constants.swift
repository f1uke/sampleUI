//
//  Constants.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation
import UIKit

class Messages {
    static let _serviceError = "เกิดข้อผิดพลาด"
    static let _serviceDataNotFound = "ไม่พบข้อมูล"
    static let _connectNetworkForUsing = "กรุณาเชื่อมต่อเครือข่ายเพื่อใช้งาน"
    static let _sessionExpire = "คุณไม่ได้ใช้งานนานเกินไป กรุณาเข้าสู่ระบบใหม่"
}

enum PatternDateFormatter: String {
    case dmy = "dd MMMM yyyy"
    case shortdmy = "dd/MM/yyyy"
    case timestamp = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case time = "HH : mm"
}

enum LocaleDateTime {
    static let th = Locale(identifier: "th_TH")
    static let en = Locale(identifier: "en_US_POSIX")
}

enum AppFonts {
    static let KanitLight14 = UIFont(name: "Kanit-Light", size: 14)
}
