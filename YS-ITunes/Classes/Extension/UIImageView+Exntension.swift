//
//  UIImageView+Exntension.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // Asenkron image download
    func downloadFromUrl(with urlString: String) {
        
        if let url = URL(string: urlString) {
      
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            indicator.color = .red
            indicator.frame = bounds
            indicator.startAnimating()
            indicator.hidesWhenStopped = true
            addSubview(indicator)
            
            let request = URLRequest(url: url)
         
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                indicator.stopAnimating()
                indicator.removeFromSuperview()
                
                if error != nil {
                    debugPrint("Image Download Error")
                    return
                }
                self.mainThread {
                    let image = UIImage(data: data!)
                    self.image = image
                }
            
            }).resume()
        }
    }
}
