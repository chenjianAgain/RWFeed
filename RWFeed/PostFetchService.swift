//
//  PostFetchService.swift
//  RWFeed
//
//  Created by ios on 15/9/23.
//  Copyright © 2015年 com.czs. All rights reserved.
//

import Foundation

struct PostFetchService: FeedServiceProtocol {
    private let urlPath = "http://www.raywenderlich.com/feed"
    
    func retrieveWeatherInfo(completionHandler: FeedCompletionHandler) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
    
        let request = NSURLRequest(URL: NSURL(string: urlPath)!)
        let task = session.dataTaskWithRequest(request) { (data, response, networkError) -> Void in
            // Check network error
            if networkError != nil {
                let error = Error(errorCode: .NetworkRequestFailed)
                completionHandler(nil, error)
                return
            }
            
            // Check xml parse
            guard let unwrappedData = data else {
                let error = Error(errorCode: .XMLSerializationFailed)
                completionHandler(nil,error)
                return
            }
            
            // Begin to parse xml
            let parser = XmlParser()
            parser.dataToParse = unwrappedData
            parser.startParse()
//            print(parser.posts)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completionHandler(parser.posts, nil)
            })
        }
        
        task.resume()
    }
}