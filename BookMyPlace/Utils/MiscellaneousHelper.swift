//
//  MiscellaneousHelper.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 25/03/24.
//

import Foundation
import UIKit

//MARK: Entension to get the screen dimensions
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class DateFormatUtility
{
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        // make sure the following are the same as that used in the API
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale.current

        return formatter
    }()

    class func shortString(fromDate date: Date) -> String {
        return formatter.string(from: date)
    }

    class func date(fromShortString string: String) -> Date? {
        return formatter.date(from: string)
    }
}
