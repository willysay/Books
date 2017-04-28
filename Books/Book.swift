//
//  Book.swift
//  Books
//
//  Created by SDS-018 on 2017. 4. 28..
//  Copyright © 2017년 SDS-018. All rights reserved.
//

import Foundation
import UIKit

class Book{
    /*
    let title:String
    let author: String?
    let coverImage:UIImage?
    let URL:String?
 */
    
    enum Key: String {
        case title = "title"
        case author = "author"
        case coverImage = "coverImage"
        case URL = "URL"
    }
    
    let title:String
    let author: String?
    let coverImage:UIImage?
    let URL:String?
    
    init(title:String, author:String?, coverImage:UIImage?, URL:String?){
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.URL = URL
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.author, forKey: "author")
        aCoder.encode(self.coverImage, forKey: "coverImage")
        aCoder.encode(self.URL, forKey: "URL")
        print("\(self.title) was encoded")
    }
    
    
    required init?(coder aDecoder:NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.author = aDecoder.decodeObject(forKey: "author") as? String
        self.coverImage = aDecoder.decodeObject(forKey: "coverImage") as? UIImage
        self.URL = aDecoder.decodeObject(forKey: "URL") as? String
    }
    
}


