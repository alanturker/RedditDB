//
//  API.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import Foundation
import Moya

enum RedditAPI {
    case redditPost
}

fileprivate let urlReddit = "https://www.reddit.com/r/flutterdev/top.json"

extension RedditAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: urlReddit) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .redditPost:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .redditPost:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .redditPost:
            return .requestParameters(parameters: ["count" : 20], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
