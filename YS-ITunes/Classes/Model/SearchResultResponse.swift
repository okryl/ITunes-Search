//
//  SearchResultResponse.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

struct SearchResultResponse {
    
    var searchResults: [SearchResult]
    var count: Int
    
    init(json: [String: AnyObject]) {
        
        let searchResultArray = json["results"] as! NSArray
        searchResults = [SearchResult]()
        
        for obj in searchResultArray {
            let searchResultObj = SearchResult(dictionary: obj as! [String : AnyObject])
            searchResults.append(searchResultObj)
        }
        count = json["resultCount"] as!Int
    }
}
