//
//  ColorExteniosn.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  class var appColor: UIColor{
    return UIColor(red: 0.106, green: 0.690, blue: 0.592, alpha: 1.00)
  }
  class var appLightGrayColor : UIColor{
    return UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1.00)
  }
    class var appRedColor : UIColor{
         return UIColor(red: 252/256, green: 91/256, blue: 93/256, alpha: 1.00)
    }
  
  class var random: UIColor {
    return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
  }
}

extension CGFloat {
  static var random: CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}
