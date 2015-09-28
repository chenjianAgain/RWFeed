//
//  Post.swift
//  RWFeed
//
//  Created by ios on 15/9/23.
//  Copyright © 2015年 com.czs. All rights reserved.
//

import Foundation

class Post: NSObject {
    
    var category: String?
    var content: String?
    var identifier: String?
    var link: String?
    var timestamp: NSDate?
    var title: String?
    
    override init() {
        super.init()
    }

}