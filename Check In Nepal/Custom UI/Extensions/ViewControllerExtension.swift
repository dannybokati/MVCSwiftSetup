//
//  ViewControllerExtension.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
import  UIKit
//import TTGSnackbar
import SwiftMessages
extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
    func showAlert(message: String? = nil, title: String? = nil,buttonTitle:String? = nil,buttonStyle: UIAlertAction.Style = .cancel,withCompletion completion:@escaping ()->() = {}) {
    let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle ?? "OK", style:buttonStyle, handler: { action in
      completion()
    }))
    self.present(alert, animated: true, completion: nil)
    
  }
  func showToast(message: String){
//    let snackbar = TTGSnackbar(message: message, duration: .middle)
//    snackbar.show()
  }
  
  func showSwiftyAlert(theme: Theme = .success, title:String = "Sucess", message: String) {
    let success = MessageView.viewFromNib(layout: .cardView)
    success.configureTheme(theme)
    success.configureDropShadow()
    success.configureContent(title: title, body: message)
    success.button?.isHidden = true
    SwiftMessages.show(view: success)
  }
  
}
extension UINavigationController {
  override open var shouldAutorotate: Bool {
    return false
  }
}
