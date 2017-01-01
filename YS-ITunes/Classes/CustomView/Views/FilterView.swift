//
//  FilterView.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import UIKit
protocol FilterViewDelegate: class {
    func doneButtonTapped(media: Media)
}
class FilterView: BaseCustomView, NibLoadableView {

    @IBOutlet weak var tableViewFilter: UITableView!
    
    weak var delegate: FilterViewDelegate?
    var isActive = false
    fileprivate var selectedMedia = Media(rawValue: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        nibSetup(FilterView.self)
       
        translatesAutoresizingMaskIntoConstraints = false
        
        tableViewFilter.delegate = self
        tableViewFilter.dataSource = self
        tableViewFilter.Register(FilterCell.self)
        tableViewFilter.backgroundColor = .black
        tableViewFilter.tableFooterView = UIView(frame: .zero)
        let indexPath = IndexPath(item: 0, section: 0)
        tableViewFilter.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }
    @IBAction func buttonDoneTapped(_ sender: Any) {
        delegate?.doneButtonTapped(media: selectedMedia!)
    }

}
extension FilterView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMedia = Media(rawValue: indexPath.row)
    }
}

extension FilterView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.DequeReusableCell(forIndexPath: indexPath) as FilterCell
        
        let media = Media(rawValue: indexPath.row)
        cell.setup(name: media?.value)
       
        return cell
    }
}
