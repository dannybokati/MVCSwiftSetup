//
//  Utility.swift
//  how
//
//  Created by Prashant Ghimire on 4/6/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Utility: NSObject{
    
  class func getEmail () -> String{
    if let email = UserDefaultsHandler().getUDValue(key: UDkey.UserEmail.rawValue) as? String{
      return email
    }
    return "12.1"
  }
  
  class func getUserID () -> String{
    return UserDefaultsHandler().getUDValue(key: UDkey.UserID.rawValue) as? String ?? "0"
  }
  
  class func getPassword () -> String{
    if let email = UserDefaultsHandler().getUDValue(key: UDkey.UserPassword.rawValue) as? String{
      return email
    }
    return "12.1"
  }

  class func dateToString(date:Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return dateFormatter.string(from:date)
  }
  
  class func stringToDate(date: String?) -> Date?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    if let oDate = date , let dataDate = dateFormatter.date(from: oDate){
      return dataDate
    }
    return nil
  }
  
  class func dateToShortForm(date:Date)-> String{
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM d"
    return dateFormatterPrint.string(from:date)
  }
    
  class func timeAgoSinceDate(_ date:Date, numericDates:Bool = false) -> String {
    let calendar = NSCalendar.current
    let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
    let now = Date()
    let earliest = now < date ? now : date
    let latest = (earliest == now) ? date : now
    let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
    
    if (components.year! >= 2) {
      return "\(components.year!) years ago"
    } else if (components.year! >= 1){
      if (numericDates){
        return "1 year ago"
      } else {
        return "Last year"
      }
    } else if (components.month! >= 2) {
      return "\(components.month!) months ago"
    } else if (components.month! >= 1){
      if (numericDates){
        return "1 month ago"
      } else {
        return "Last month"
      }
    } else if (components.weekOfYear! >= 2) {
      return "\(components.weekOfYear!) weeks ago"
    } else if (components.weekOfYear! >= 1){
      if (numericDates){
        return "1 week ago"
      } else {
        return "Last week"
      }
    } else if (components.day! >= 2) {
      return "\(components.day!) days ago"
    } else if (components.day! >= 1){
      if (numericDates){
        return "1 day ago"
      } else {
        return "Yesterday"
      }
    } else if (components.hour! >= 2) {
      return "\(components.hour!) hours ago"
    } else if (components.hour! >= 1){
      if (numericDates){
        return "1 hour ago"
      } else {
        return "An hour ago"
      }
    } else if (components.minute! >= 2) {
      return "\(components.minute!) minutes ago"
    } else if (components.minute! >= 1){
      if (numericDates){
        return "1 minute ago"
      } else {
        return "A minute ago"
      }
    } else if (components.second! >= 3) {
      return "\(components.second!) seconds ago"
    } else {
      return "Just now"
    }
  }

  class StringToDate{
    static func stringToDate(date: String) -> Date {
      let formatter = DateFormatter()
      
      // Format 1
      formatter.dateFormat = "yyyy-MM-dd'T'HH🇲🇲ss.SSSZ"
      if let parsedDate = formatter.date(from: date) {
        return parsedDate
      }
      
      // Format 2
      formatter.dateFormat = "yyyy-MM-dd'T'HH🇲🇲SSSZ"
      if let parsedDate = formatter.date(from: date) {
        return parsedDate
      }
      
      // Couldn't parsed with any format. Just get the date
      let splitedDate = date.components(separatedBy: "T")
      if splitedDate.count > 0 {
        formatter.dateFormat = "yyyy-MM-dd"
        if let parsedDate = formatter.date(from: splitedDate[0]) {
          return parsedDate
        }
      }
      
      // Nothing worked!
      return Date()
    }
  }
  class func removeUserdefaultData(){
//    if let categoryData =  Utility.getCategoryData() {
//      for cat in categoryData {
//        if cat.howAppCategory == true {
//          Messaging.messaging().unsubscribe(fromTopic: cat.id!)
//        }
//      }
//    }
//    Messaging.messaging().unsubscribe(fromTopic: Utility.getUserID())
//    Messaging.messaging().unsubscribe(fromTopic: Utility.getUserID() + "S")
//    FollowingResponseModel.requestForFollowingListID()
//    UserDefaultsHandler().removeUD(key: UDkey.Token.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.TokenExpire.rawValue)
//    //    UserDefaultsHandler().removeUD(key: UDkey.FirstTimeDashboard.rawValue)
//    //    UserDefaultsHandler().removeUD(key: UDkey.FirstTimePost.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.UserEmail.rawValue)
//    //    UserDefaultsHandler().removeUD(key: UDkey.FirstTimeReminder.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.WebSite.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.ExtraContain.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.UserName.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.UserCountry.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.userHasPurchasedInApp.rawValue)
//    UserDefaultsHandler().removeUD(key: UDkey.UserImage.rawValue)
  }
}
// MARK: - double marking
extension Int {
  var roundedWithAbbreviations: String {
    let number = Double(self)
    let thousand = number / 1000
    let million = number / 1000000
    if million >= 1.0 {
      return "\(round(million*10)/10)M"
    }
    else if thousand >= 1.0 {
      return "\(round(thousand*10)/10)K"
    }
    else {
      return "\(Int(number))"
    }
  }
}

