//
//  CustomNavigationController.swift
//  how
//
//  Created by Prashant Ghimire on 9/24/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.isTranslucent = false
    self.navigationBar.tintColor = UIColor.white
    self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "backBtnImage")// will remove back "<" from back8
    self.navigationBar.backIndicatorTransitionMaskImage = UIImage()
    self.navigationBar.barTintColor = UIColor.appColor
    self.navigationBar.backgroundColor = .clear
    self.view.backgroundColor = .clear
    self.navigationBar.barStyle = .blackOpaque
//    if #available(iOS 11, *) {
//      UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
//      UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .highlighted)
//    } else {
//      UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0,
//                                                                                     -60), for:UIBarMetrics.default)
//    }
  }
}
