//
//  ComicEndpoint.swift
//  ComicsInfo
//
//  Created by Aleksandar Dinic on 09/08/2021.
//

import Foundation

enum ComicEndpoint: EndpointType {
    
    case getAllComics(forSeriesID: String, afterID: String?, limit: Int)
    case getComic(withID: String)
    
    var baseURL: URL {
        Environment.rootURL
    }
    
    var path: String {
        switch self {
        case .getAllComics:
            return "/comics"
        case let .getComic(comicID):
            return "/comics/\(comicID)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAllComics, .getComic:
            return .GET
        }
    }
    
    var body: Data? {
        nil
    }
    
    var queryParameters: [String: String]? {
        switch self {
        case let .getAllComics(seriesID, afterID, limit):
            var parameters = [
                "seriesID": seriesID,
                "limit": "\(limit)"
            ]
            
            if let afterID = afterID {
                parameters["afterID"] = afterID
            }
            
            return parameters
        default:
            return nil
        }
    }
    
    var headers: [String: String]? {
        nil
    }
    
}


