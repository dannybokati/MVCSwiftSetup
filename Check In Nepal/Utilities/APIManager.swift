//
//  APIManager.swift
//  how
//
//  Created by Prashant Ghimire on 4/4/18.
//  Copyright © 2018 Otonomis Limited. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SVProgressHUD

public class APIManager{
  var request: DataRequest!
  
  public init (urlString: String, parameters: [String: AnyObject]? = nil, headers: [String: String] = [String:String](), method: Alamofire.HTTPMethod = .post) {
    var headers = headers, parameters = parameters
    if let token = UserDefaultsHandler().getUDValue(key: UDkey.Token.rawValue) as? String{
      if let _ = parameters{
         parameters!["access_token"] =  token as AnyObject
      }else{
        parameters = ["access_token":token] as [String : AnyObject]
      }
    }
    print(headers)
    print(parameters)
    self.request = Alamofire.SessionManager.default.request(urlString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
  }
  func handleResponse<T: DefaultResponse>(viewController: UIViewController,progressMessage: String? = nil,showProgressHud: Bool = true,_ completionHandler: @escaping (T)-> Void, errorBlock: ((T)->Void)? = nil,failureBlock: ((String)->Void)? = nil) {
    
    let googleTest = Reachability(hostname: "www.google.com")
    guard let result = googleTest?.isReachable, result else {
      failureBlock?("No internet Connection")
//      viewController.showAlert(message: "No Internet Connection", title: "Error", buttonTitle: "OK", buttonStyle: .cancel)
//      toastMessage(viewController: viewController, toastMessage: "Internet Connection Error")
//      let alertController = UIAlertController (title: "No Internet Connection", message: "Do you want to enable data / wifi from settting?", preferredStyle: .alert)
//      let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
//        UIApplication.shared.open(URL(string:"App-Prefs:root=General")!, options: [:], completionHandler: nil)
//      }
//      alertController.addAction(settingsAction)
//      let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//      alertController.addAction(cancelAction)
//      viewController.present(alertController, animated: true, completion: nil)
      failureBlock?("Server Error")
      return
    }
    if showProgressHud && SVProgressHUD.isVisible() == false{
         ProgressHud.showProgressHUD()
    }
 
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 500 // seconds
    configuration.timeoutIntervalForResource = 500
    _ = Alamofire.SessionManager(configuration: configuration)
    
//    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    self.request.responseObject {[weak self] (response: DataResponse<T>) in
      ProgressHud.hideProgressHUD()
//          UIApplication.shared.isNetworkActivityIndicatorVisible = false
      switch response.result {
      case .success(let dataX):
        if dataX.code == 403{
          viewController.showAlert(message: "", title: "You have been logged out. Please, log in again", buttonTitle: "OK", buttonStyle: .cancel, withCompletion: {
            Utility.removeUserdefaultData()
            AppDelegate.sharedAppDelegate()?.loadLoginScreen()
          })
        }else{
            completionHandler(dataX)
        }

      case .failure(let error):
        print(error)
        viewController.showAlert(message: "Server Error Please Try Again Later!", title: "", buttonTitle: "Ok")
        failureBlock?("Server Error")
        viewController.navigationController?.popViewController(animated: true)
      }
      
    }
    
    //delete
    self.request.responseJSON {[unowned self] (response) in
      print(response.result.value)
      print(response.result)
      print(response.error)
      print(response.response)
      print(response.request ?? "No request")
      switch response.result {
      case .failure(let error):
        print(error)
      case .success(let val):
        print(val)
      }
    }
    
  }
  
  
}
func toastMessage(viewController: UIViewController, toastMessage : String){
  let toastLabel = UILabel(frame: CGRect(x: viewController.view.frame.width/2 - (viewController.view.frame.width/2)/2,y: viewController.view.frame.height - 85, width: viewController.view.frame.width/2, height: 35))
  
  toastLabel.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.141, alpha: 1.00)
  
  toastLabel.textColor = UIColor.white
  toastLabel.text = toastMessage
  toastLabel.textAlignment = NSTextAlignment.center
  toastLabel.adjustsFontSizeToFitWidth = true
  viewController.view.addSubview(toastLabel)
  toastLabel.alpha = 1.0
  toastLabel.layer.cornerRadius = 10;
  toastLabel.clipsToBounds  =  true
  UIView.animate(withDuration: 4, delay: 0.1, options: .curveEaseOut, animations: {
    toastLabel.alpha = 0.0
  }, completion: { _ in
    toastLabel.removeFromSuperview()
  })
}

class ProgressHud: NSObject {
  class func showProgressHUD(){
    SVProgressHUD.show()
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
    SVProgressHUD.setForegroundColor (UIColor.appColor)
    SVProgressHUD.setBackgroundColor (UIColor.clear)
//    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
//    SVProgressHUD.setRingNoTextRadius(20)
//    SVProgressHUD.setRingThickness(3)
//    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
  }
  
  class func hideProgressHUD(){
    SVProgressHUD.dismiss()
  }
}

