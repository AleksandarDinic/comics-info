//
//  FeedbackEndpoint.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 03/09/2021.
//  Copyright © 2021 Aleksandar Dinic. All rights reserved.
//

import Foundation

enum FeedbackEndpoint: EndpointType {
    
    case create(feedback: Data, token: String?)
    
    var baseURL: URL {
        Environment.rootURL
    }
    
    var path: String {
        switch self {
        case .create:
            return "/feedback"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .create:
            return .POST
        }
    }
    
    var body: Data? {
        switch self {
        case let .create(feedback, _):
            return feedback
        }
    }
    
    var queryParameters: [String: String]? {
        nil
    }
    
    var headers: [String: String]? {
        switch self {
        case let .create(_, token):
            guard let token = token else {
                return nil
            }
            return ["Authorization": token]
        }
    }
    
}
