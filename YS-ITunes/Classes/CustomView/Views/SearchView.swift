//
//  SearchView.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 30/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: class {
    func cellTapped(detailObject: SearchResult)
}

class SearchView: BaseCustomView, NibLoadableView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewSearch: UITableView!
    
    weak var delegate: SearchViewDelegate?
    var selectedMedia = Media(rawValue: 0) {
        didSet {
            searchBar.resignFirstResponder()
            searchRequest(with: searchBar.text)
        }
    }
    fileprivate var dataSource: SearchResultResponse? {
        didSet{
            tableViewSearch.reloadData()
        }
    }
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - Setup UI
    private func setup() {
        nibSetup(SearchView.self)
        
        tableViewSearch.dataSource = self
        tableViewSearch.delegate = self
        tableViewSearch.Register(SearchCell.self)
        tableViewSearch.tableFooterView = UIView(frame: .zero)
        
        searchBar.delegate = self
        
        addToolBar()
    }
    
    //MARK: - Request Handler
    fileprivate func searchRequest(with searchText: String!) {
        ITunesSearchApi.sharedInstance().search(withText: searchText, offType: selectedMedia!, success: {(response) in
            
            self.dataSource = SearchResultResponse(json: response)
            
        }, failure: {(errorString) in
            
        })
    }
}

//MARK: - UITableViewDelegate
extension SearchView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.resignFirstResponder()
        
        let detailObject = dataSource!.searchResults[indexPath.row]
        delegate?.cellTapped(detailObject: detailObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//MARK: - UITableViewDataSource
extension SearchView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dataSource?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSearch.DequeReusableCell(forIndexPath: indexPath) as SearchCell
        cell.setup(searchResult: dataSource?.searchResults[indexPath.row])
        
        return cell
    }
}

//MARK: - UISearchBarDelegate
extension SearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchText.isEmpty) {
            searchBar.resignFirstResponder()
            dataSource = nil
        }
        if searchText.characters.count >= 2 {
            searchRequest(with: searchText)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
//MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
    
    func addToolBar(){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .red
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(
            cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        searchBar.inputAccessoryView = toolBar
    }
    func donePressed(){
        self.endEditing(true)
    }
    func cancelPressed(){
        searchBar.text = ""
        dataSource = nil
        self.endEditing(true) 
    }
}
