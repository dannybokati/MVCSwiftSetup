//
//  DefaultResponse.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

protocol MappableExtended: Mappable{
  var message: String? {get}
  var code: Int? {get}
  
}

class DefaultResponse:NSObject,NSCoding, MappableExtended {
  private var responseCode : Int?
  private var messageString: String?
  var notificationCount: Int?
  var yourClapCount: Int?
  var clapCount: Int?
  var followingList: [String]?
  
  var message: String? {
    get {
      return messageString
    }
  }
  
  var code: Int? {
    get {
      return responseCode
    }
  }

  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    responseCode <- map["code"]
    messageString <- map["message"]
    notificationCount <- map["extras.count"]
    yourClapCount <- map["your_clap_count"]
    clapCount <- map["claps_count"]
    followingList <- map["extras.followed"]
  }
  
  required init?(coder aDecoder: NSCoder) {
  }
  
  override init() {
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    
  }
}
