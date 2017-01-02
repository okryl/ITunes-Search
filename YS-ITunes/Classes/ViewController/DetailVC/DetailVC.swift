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
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetail.detailObject = detailObject
        setupNavigationBar()
        
    }
    
    //MARK: - Setup UI
    private func setupNavigationBar() {
        navigationItem.title = "Detail"
        navigationItem.backBarButtonItem?.title = ""
    }
}
