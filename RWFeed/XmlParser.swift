//
//  XmlParser.swift
//  RWFeed
//
//  Created by ios on 15/9/23.
//  Copyright © 2015年 com.czs. All rights reserved.
//

/*
var category: String?
var content: String?
var identifier: String?
var link: String?
var timestamp: NSDate?
var title: String?
*/

import Foundation

class XmlParser: NSObject, NSXMLParserDelegate {
    var dataToParse: NSData?
    var posts: [Post] = []
    
    var tempString: String?
    
    var tempPost: Post?
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item" {
            tempPost = Post()
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {

        self.tempString = string
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            posts.append(tempPost!)
        } else if self.tempString?.isEmpty != true {
            if elementName == "title" {
                tempPost?.title = self.tempString
            } else if elementName == "content" {
                tempPost?.content = self.tempString
            } else if elementName == "category" {
                tempPost?.category = self.tempString
            } else if elementName == "link" {
                tempPost?.link = self.tempString
            } else if elementName == "identifier" {
                tempPost?.identifier = self.tempString
            }

        }
    }
    
    func startParse() {
        let parser = NSXMLParser(data: dataToParse!)
        parser.delegate = self;
        parser.parse()
    }
}