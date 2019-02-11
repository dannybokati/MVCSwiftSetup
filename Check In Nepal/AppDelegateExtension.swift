//
//  AppDelegateExtension.swift
//  Check In Nepal
//
//  Created by Danny Bokati on 2/11/19.
//  Copyright © 2019 Peace Nepal Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit
import TTGSnackbar

extension AppDelegate {
    
    class func sharedAppDelegate() -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate;
    }
    
    // MARK: - change root animation
    func changeRootViewController(with identifier:String , storyboard name: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let desiredViewController = storyboard.instantiateViewController(withIdentifier: identifier);
        
        let snapshot:UIView = (self.window?.snapshotView(afterScreenUpdates: true))!
        desiredViewController.view.addSubview(snapshot);
        
        self.window?.rootViewController = desiredViewController;
        
        UIView.animate(withDuration: 0.3, animations: {() in
            snapshot.layer.opacity = 0;
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
        });
    }
    
    // MARK: Onboard Navigation methods
    func loadLoginScreen(){
        let loginStoryboard = UIStoryboard(name:StoryboardName.Login.rawValue, bundle: nil)
        let loginVC = loginStoryboard.instantiateViewController(withIdentifier:"LoginViewController") as! LoginViewController
        let onBoardingVC  = loginStoryboard.instantiateViewController(withIdentifier: "OnBoardingVC") as! OnBoardingViewController
        let dashNav = CustomNavigationController()
        dashNav.setViewControllers([onBoardingVC,loginVC], animated: true)
        self.window?.rootViewController = dashNav
        self.window?.makeKeyAndVisible()
    }
    
    func loadStartUpScreen() {
        if let _ = UserDefaultsHandler().getUDValue(key: UDkey.Token.rawValue) as? String{
            loadLoginScreen()
            checkTokenExpire()
        }else{
            loadBoardingScreen()
        }
    }
    
    func loadBoardingScreen() {
        let loginStoryboard = UIStoryboard(name:StoryboardName.Login.rawValue, bundle: nil)
        let onBoardingVC = loginStoryboard.instantiateViewController(withIdentifier: "OnBoardingVC") as! OnBoardingViewController
        let nav = CustomNavigationController(rootViewController: onBoardingVC)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
    
    func loadDashboard()  {
        let dashboardStoryBoard = UIStoryboard(name:StoryboardName.Dashboard.rawValue, bundle: nil)
        let dashboardVC = dashboardStoryBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        self.window?.rootViewController = dashboardVC
        self.window?.makeKeyAndVisible()
    }
    
    //MARK: Token Expiry Check
    private func checkTokenExpire(){
        if let date = UserDefaultsHandler().getUDValue(key: UDkey.TokenExpire.rawValue)as? Date {
            if date < Date(){
                //Utility.removeUserdefaultData()
                //AppDelegate.sharedAppDelegate()?.loadLoginScreen()
                if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
                    let overlayView = UIView(frame: rootVC.view.bounds)
                    overlayView.backgroundColor = .white
                    overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    window?.addSubview(overlayView)
//                    LoginResponseModel.requestForLogin(Utility.getEmail(), andPassword: Utility.getPassword(), forController: rootVC, withCompletion: {
//                        CategoriesResponseModel.requestForCategories(forController: rootVC, withCompletion: { (response) in
//                            overlayView.removeFromSuperview()
//                            self.loadTabBar()
//                            self.getNotificaitonCount()
//                        }) {
//                        }
//                    }){
//                        overlayView.removeFromSuperview()
//                    }
                }
            } else {
                self.loadDashboard()
            }
        } else {
            self.loadDashboard()
        }
    }
    
}
