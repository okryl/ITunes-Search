//
//  ReusableCell.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

protocol ReusableCell: class {}

extension ReusableCell where Self: UIView {
    
    static var ReuseIdentifier: String {
        return String(describing: self)
    }
}

