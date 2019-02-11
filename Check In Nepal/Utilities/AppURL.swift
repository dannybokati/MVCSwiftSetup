//
//  AppURL.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
class HowURL: NSObject {
  static let LocalURL = "http://192.168.1.9/"
  static let LiveURL = "https://thehowapp.com/"
  static let baseURL = LiveURL
  
  static  var URLLogin:String = {
    let url = baseURL + "login"
    return url
  }()
    static  var URLEditPost:String = {
        let url = baseURL + "editPost"
        return url
    }()
  static  var URLFollowing:String = {
    let url = baseURL + "following_list"
    return url
  }()
  static  var URLFollowers:String = {
    let url = baseURL + "follower_list"
    return url
  }()
  
  static  var URLSignUp:String = {
    let url = baseURL + "signup"
    return url
  }()
  
  static  var URLSharePost:String = {
    let url = baseURL + "share"
    return url
  }()
  
  static  var URLCategories:String = {
    let url = baseURL + "categories"
    return url
  }()
  
  static  var URLUsage:String = {
    let url = baseURL + "usage"
    return url
  }()
  
  static var URLForgotPassword:String = {
    let url = baseURL + "password_reset"
    return url
  }()
  
  static var URLSearch:String = {
    let url = baseURL + "query"
    return url
  }()
  static var URLAddMedia:String = {
    let url = baseURL + "media"
    return url
  }()
  static var URLDiscover: String = {
    let url = baseURL + "discover"
    return url
  }()
  static var URLGetInterest: String = {
    let url = baseURL + "interests"
    return url
  }()
  
  static var URLPostDetail: String = {
    let url = baseURL + "post"
    return url
  }()
  static var URLPostLike: String = {
    let url = baseURL + "like"
    return url
  }()
  static var URLPosBookmark: String = {
    let url = baseURL + "bookmark"
    return url
  }()
    static var URLGetClaps: String = {
        let url = baseURL + "your_claps"
        return url
    }()
  static var URLGetLike: String = {
    let url = baseURL + "your_likes"
    return url
  }()
  static var URLGetShare: String = {
    let url = baseURL + "user_share"
    return url
  }()
  static var URLGetBookmark: String = {
    let url = baseURL + "your_bookmarks"
    return url
  }()
  static var URLProfile: String = {
    let url = baseURL + "user_profile"
    return url
  }()
  static var URLAddInterest: String = {
    let url = baseURL + "interests/add"
    return url
  }()
  static var URLDeleteInterest: String = {
    let url = baseURL + "interests/delete"
    return url
  }()
  static var URLGetReminders: String = {
    let url = baseURL + "reminders"
    return url
  }()
  static var URLGetConversations: String = {
    let url = baseURL + "conversations"
    return url
  }()
  static var URLGetMessageDetail: String = {
    let url = baseURL + "message"
    return url
  }()
  static var URLCategoryUsages: String = {
    let url = baseURL + "usage"
    return url
  }()
  static var URLAppUsages: String = {
    let url = baseURL + "app_usage"
    return url
  }()
  static var URLSetProfile: String = {
    let url = baseURL + "profile"
    return url
  }()
  
  static var URLReporting: String = {
    let url = baseURL + "report"
    return url
  }()
  
  static var URLDashboard: String = {
    let url = baseURL + "dashboard"
    return url
  }()
  static var URLMoment: String = {
    let url = baseURL + "moments"
    return url
  }()
  static var URLChangePassword: String = {
    let url = baseURL + "user/password"
    return url
  }()
  static var URLProfileSearch: String = {
    let url = baseURL + "users/query"
    return url
  }()
  static var URLResentVerificaiton: String = {
    let url = baseURL + "resend_verification"
    return url
  }()
  // new changes
  static var URLPopular: String = {
    let url = baseURL + "popular"
    return url
  }()
  static var URLMyFollingPost: String = {
    let url = baseURL + "following"
    return url
  }()
  static var URLForYouPost: String = {
    let url = baseURL + "foryou"
    return url
  }()
  static var URLFollowUser: String = {
    let url = baseURL + "follow"
    return url
  }()
  static var URLNotification: String = {
    let url = baseURL + "notifications"
    return url
  }()
  static var URLUpdateUserNotificaiton: String = {
    let url = baseURL + "update_user"
    return url
  }()
  static var URLNotificationCount: String = {
    let url = baseURL + "notification/count"
    return url
  }()
  static var URLMessageCount: String = {
    let url = baseURL + "message/count"
    return url
  }()
  static var URLUpdateMessage: String = {
    let url = baseURL + "update_message_status"
    return url
  }()
  static var URLGetTempToken: String = {
    let url = baseURL + "get_temp_token"
    return url
  }()
  static var URLClap: String = {
    let url = baseURL + "clap"
    return url
  }()
  static var URLGetFollowingList: String = {
    let url = baseURL + "my_followings"
    return url
  }()
  static var URLSendReceipt: String = {
    let url = baseURL + "receipt"
    return url
  }()
  static var URLCheckPaymentStatus: String = {
    let url = baseURL + "checkPaymentStatus"
    return url
  }()
  static var URLGetHowContent: String = {
    let url = baseURL + "howAppContent"
    return url
  }()
}
