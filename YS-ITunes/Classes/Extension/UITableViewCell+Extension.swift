//
//  UITableViewCell+Extension.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

extension UITableView {
        
    func Register<T: UITableViewCell>(_: T.Type) where T: ReusableCell, T: NibLoadableView {
        
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.ReuseIdentifier)
    }
    
    func DequeReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath!) -> T where T: ReusableCell {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.ReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseIdentifier)")
        }
        
        return cell
    }
}

