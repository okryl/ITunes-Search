//
//  BaseCustomView.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit


class BaseCustomView: UIView {

    @IBOutlet weak var contentView: UIView!
}

extension BaseCustomView {
    
    private func loadViewFromNib<T: BaseCustomView>(_: T.Type) -> UIView where T: NibLoadableView {
     
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName:T.NibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func nibSetup<T: BaseCustomView>(_: T.Type) where T: NibLoadableView {
        
        contentView = loadViewFromNib(T.self)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(contentView)
    }
}