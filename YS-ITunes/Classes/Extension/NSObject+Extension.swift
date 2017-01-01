//
//  NSObject+Extension.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

extension NSObject {
    
    func mainThread(main: @escaping () -> ()) {
        DispatchQueue.main.async(execute: {
            main()
        })
        
    }
}
