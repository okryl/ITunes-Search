//
//  DetailVC.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var viewDetail: DetailView!
    var detailObject: SearchResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetail.detailObject = detailObject
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
