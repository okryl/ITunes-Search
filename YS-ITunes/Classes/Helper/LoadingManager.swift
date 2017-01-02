//
//  LoadingManager.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

/*
 Request atilirken ekranda loading gostermeyi saglar
 */
class LoadingManager: NSObject {
    
    private let blackView = UIView()
    private static var instance : LoadingManager?
   
    var activityIndicator:UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    static func sharedInstance() -> LoadingManager {
        if instance == nil {
            instance = LoadingManager()
        }
        return instance!
    }
        
    func startIndicator() {
        
        mainThread{
            if let window = UIApplication.shared.keyWindow {
                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.2)
                self.blackView.frame = window.frame
                self.blackView.alpha = 1.0
                self.blackView.addSubview(self.activityIndicator)
                self.activityIndicator.center = self.blackView.center
                self.activityIndicator.startAnimating()
                self.activityIndicator.hidesWhenStopped = true
                
                window.addSubview(self.blackView)
            }
        }
    }
    
    func stopIndicator(){
        mainThread{
            self.activityIndicator.stopAnimating()
            self.blackView.alpha = 0.0
            self.blackView.removeFromSuperview()
        }
    }
}
