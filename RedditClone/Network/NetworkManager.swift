//
//  NetworkManager.swift
//  RedditClone
//
//  Created by Türker on 12.10.2021.
//

import Foundation
import Moya

typealias redditCompletion = ([Results]) -> ()

protocol Networkable {
    func fetchReddit(completionHandler: @escaping redditCompletion)
}

final class NetworkManager: Networkable {
    
    var provider = MoyaProvider<RedditAPI>(plugins: [NetworkLoggerPlugin()])
    
    func fetchReddit(completionHandler: @escaping redditCompletion) {
        provider.request(.redditPost) { redditResponse in
            switch redditResponse {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(RedditResponse.self, from: response.data)
                    completionHandler(results.postData.childrens)
                } catch let responseError {
                    print("responseError: \(responseError)")
                }
            case .failure(let serverError):
                print("serverError: \(serverError)")
            }
        }
    }
    
}
