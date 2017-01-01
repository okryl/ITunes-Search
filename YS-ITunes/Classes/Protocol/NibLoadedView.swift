//
//  NibLoadedView.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
    
}
