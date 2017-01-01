//
//  ITunesSearchAPI.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

import Foundation

typealias successBlock = (_ response: [String: AnyObject]) ->Void
typealias failureBlock = (_ error: String) -> Void


final class ITunesSearchApi: NSObject {
    
    private let baseURL = "https://itunes.apple.com/search?term="
    private static var instance : ITunesSearchApi?
    
    static func sharedInstance() -> ITunesSearchApi {
        if instance == nil {
            instance = ITunesSearchApi()
        }
        return instance!
    }
    
    func search(withText text: String, offType media: Media, success:@escaping successBlock, failure: @escaping failureBlock) {
        LoadingManager.sharedInstance().startIndicator()
        
        guard let url = buildUrl(searchText: text, mediaType: media)  else {fatalError("URL ERROR")}
        
        let task = startTask(withURL: url, success: success, failure: failure)
        task.resume()
    }
    
    private func startTask(withURL url: URL,success:@escaping successBlock, failure: @escaping failureBlock) -> URLSessionTask{
        return URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            LoadingManager.sharedInstance().stopIndicator()
          
            guard let httpResponse =  response as? HTTPURLResponse else {
                self.mainThread {
                    failure("HTTP RESPONSE ERROR")
                }
                return
            }
            
            guard httpResponse.statusCode == 200
                else {
                    self.mainThread {
                        failure("HTTP RESPONSE STATUS CODE ERROR")
                    }
                    return
            }
            
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                else {
                    self.mainThread {
                        failure("JSON ERROR")
                    }
                    return
            }
            self.mainThread {
                success(json)
            }
        })
        
    }
    func buildUrl(searchText: String!, mediaType: Media!) -> URL? {
        
        let text = searchText.replacingOccurrences(of: " ", with: "+")
        
        return URL(string: baseURL + text + "&media=" + mediaType.url)
    }
    
}
