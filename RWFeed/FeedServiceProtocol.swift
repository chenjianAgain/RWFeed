//
//  FeedServiceProtocol.swift
//  RWFeed
//
//  Created by ios on 15/9/23.
//  Copyright © 2015年 com.czs. All rights reserved.
//

import Foundation

typealias FeedCompletionHandler = ([Post]?, Error?) -> Void

protocol FeedServiceProtocol {
    func retrieveWeatherInfo(completionHandler: FeedCompletionHandler)
}
