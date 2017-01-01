//
//  SearchResult.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 01/01/17.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation


struct SearchResult {
    
    var wrapperType : String?
    var kind : String?
    var artistId : Int?
    var collectionId : Int?
    var trackId : Int?
    var artistName : String?
    var collectionName : String?
    var trackName : String?
    var collectionCensoredName : String?
    var trackCensoredName : String?
    var artistViewUrl : String?
    var collectionViewUrl : String?
    var trackViewUrl : String?
    var previewUrl : String?
    var artworkUrl30 : String?
    var artworkUrl60 : String?
    var artworkUrl100 : String?
    var collectionPrice : Double?
    var trackPrice : Double?
    var collectionExplicitness : String?
    var trackExplicitness : String?
    var discCount : Int?
    var discNumber : Int?
    var trackCount : Int?
    var trackNumber : Int?
    var trackTimeMillis : Int?
    var country : String?
    var currency : String?
    var primaryGenreName : String?
    
    init(dictionary: [String:AnyObject]) {
        
        wrapperType = dictionary["wrapperType"] as? String
        kind = dictionary["kind"] as? String
        artistId = dictionary["artistId"] as? Int
        collectionId = dictionary["collectionId"] as? Int
        trackId = dictionary["trackId"] as? Int
        artistName = dictionary["artistName"] as? String
        collectionName = dictionary["collectionName"] as? String
        trackName = dictionary["trackName"] as? String
        collectionCensoredName = dictionary["collectionCensoredName"] as? String
        trackCensoredName = dictionary["trackCensoredName"] as? String
        artistViewUrl = dictionary["artistViewUrl"] as? String
        collectionViewUrl = dictionary["collectionViewUrl"] as? String
        trackViewUrl = dictionary["trackViewUrl"] as? String
        previewUrl = dictionary["previewUrl"] as? String
        artworkUrl30 = dictionary["artworkUrl30"] as? String
        artworkUrl60 = dictionary["artworkUrl60"] as? String
        artworkUrl100 = dictionary["artworkUrl100"] as? String
        collectionPrice = dictionary["collectionPrice"] as? Double
        trackPrice = dictionary["trackPrice"] as? Double
        collectionExplicitness = dictionary["collectionExplicitness"] as? String
        trackExplicitness = dictionary["trackExplicitness"] as? String
        discCount = dictionary["discCount"] as? Int
        discNumber = dictionary["discNumber"] as? Int
        trackCount = dictionary["trackCount"] as? Int
        trackNumber = dictionary["trackNumber"] as? Int
        trackTimeMillis = dictionary["trackTimeMillis"] as? Int
        country = dictionary["country"] as? String
        currency = dictionary["currency"] as? String
        primaryGenreName = dictionary["primaryGenreName"] as? String
    }
    
}
