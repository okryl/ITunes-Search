//
//  ViewController.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 29/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit


class HomeVC: UIViewController {
    
    @IBOutlet weak var viewSearch: SearchView!
    @IBOutlet weak var viewFilter: FilterView!
    @IBOutlet weak var viewFilterHeight: NSLayoutConstraint!
    @IBOutlet weak var viewFilterBottom: NSLayoutConstraint!
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewFilter.delegate = self
        viewSearch.delegate = self
        setupNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Setup UI
    private func setupNavigationBar(){
        let buttonRight = UIButton(type: .custom)
        buttonRight.setImage(#imageLiteral(resourceName: "icon_filter"), for: .normal)
        buttonRight.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        buttonRight.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        let item = UIBarButtonItem(customView: buttonRight)
        navigationItem.rightBarButtonItem = item
        
        navigationItem.title = "Search"
    }
    
    func tapped() {
        viewSearch.endEditing(true)
       
        viewFilter.isActive = !viewFilter.isActive
        if viewFilter.isActive {
            viewFilterHeight.constant = view.frame.height
            viewFilterBottom.constant = 0
            UIView.animate(withDuration:0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

//MARK: - Filter View Delegate
extension HomeVC: FilterViewDelegate {
    func doneButtonTapped(media: Media) {
        viewSearch.selectedMedia = media
        viewSearch.endEditing(true)
        
        viewFilterHeight.constant = 0
        viewFilterBottom.constant = -10
        UIView.animate(withDuration:0.5, animations: {
            self.view.layoutIfNeeded()
        })
        
    }
}

//MARK: - Search View Delegate
extension HomeVC: SearchViewDelegate {
  
    func cellTapped(detailObject: SearchResult) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.detailObject = detailObject
     
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
