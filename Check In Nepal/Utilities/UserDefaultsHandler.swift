//
//  UserDefaultsHandler.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
//enum TokenType: String {
//    case Temporary = "Temporary"
//    case Permanent = "Permanent"
//}
enum UDkey: String {
  case UserID = "UserID"
  case Token = "Token"
//  case SelectedCategories = "Categories"
  case TokenExpire = "TokenExpire"
  case UserEmail = "Email"
  case UserPassword = "Password"
//  case Category = "Category"
//  case FirstTimePost = "FirstTimePost"
//  case WebSite = "WebSite"
//  case ExtraContain = "ExtraContain"
//  case UserName = "UserName"
//  case UserCountry = "UserCountry"
//  case FirstTimeDashboard = "FirstTimeDashboard"
//  case FirstTimeReminder = "FirstTimeReminder"
//  case LoginType = "LoginType"
//  case ProviderID = "ProviderID"
//  case UserImage = "userImage"
//  case MessageCount = "MessageCount"
//
//  case NotificaitonCount = "NotificaitonCount"
//  case TokenType = "TokenType"
//
//  case AddressOne = "addressOne"
//  case AddressTwo = "addressTwo"
//  case City = "city"
//  case State = "state"
//  case ZipCode = "zipCode"
//  case Country = "country"
//  case WechatLoginType = "wechatLoginType"
//  case extendedPurchase = "extendedPurchase"
//  case userHasPurchasedInApp = "userHasPurchasedInApp"
}

struct UserDefaultsHandler {
  
  let userDefault = UserDefaults.standard
  
  func setToUD(key: String, value: AnyObject) {
    self.userDefault.setValue(value, forKeyPath: key)
    self.userDefault.synchronize()
  }
  
  func setDataUD(key:String,value:AnyObject) {
    self.userDefault.set(value, forKey: key)
    self.userDefault.synchronize()
  }
  
  func removeUD(key: String) {
    self.userDefault.removeObject(forKey: key)
  }
  
  func getUDValue(key:String) -> AnyObject? {
    return self.userDefault.value(forKey: key) as AnyObject?
  }
  
  
}
