//
//  Reddit.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import Foundation

struct RedditResponse: Codable {
    let postData: RedditChildren
    
    private enum CodingKeys: String, CodingKey {
        case postData = "data"
    }
}

struct RedditChildren: Codable {
    let childrens: [Results]
    
    private enum CodingKeys: String, CodingKey {
        case childrens = "children"
    }
}

struct Results: Codable {
    let dataReddit: Reddit
    
    private enum CodingKeys: String, CodingKey {
        case dataReddit = "data"
    }
}

struct Reddit: Codable {
    let title: String?
    let thumbnail: String?
    let authorName: String?
    let selftext: String?
    let subreddit: String?
    let allAwardings: [DescriptionResponse]
    
    private enum CodingKeys: String, CodingKey {
        case title, thumbnail, authorName = "author_fullname", selftext, subreddit, allAwardings = "all_awardings"
    }
}

struct DescriptionResponse: Codable {
    let descriptionModel: String?
    
    private enum CodingKeys: String, CodingKey {
        case descriptionModel = "description"
    }
}
