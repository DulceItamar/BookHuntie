//
//  ListOfBooksAPIClient.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 08/06/24.
//

import Foundation


class AppEnvironment {
    enum Base {
        case gutendex
    }
    func getURL(api: Base) -> URL?{
      
        switch api {
            case .gutendex:
                
                guard let url = URL(string: "https://gutendex.com") else { return nil }
            
                return url
        }
    }
}



protocol RouterProtocol {
    func routeGutendexEndpoint(_ endpoint: Endpoint) -> URL?
}



final class Router: RouterProtocol {

    
    private let enviroment: AppEnvironment
    
    init(enviroment: AppEnvironment = AppEnvironment()) {
        self.enviroment = enviroment
    }
    
    private struct RouterEndpoint: Endpoint {
        
        var path: String
        var method: HTTPMethod
        var query: String
        var searchValue: String?
        
    }
    
//   private func routedEndpoint(_ endpoint: Endpoint, api: AppEnvironment.Base) -> Endpoint {
//        
//        
//        var url = enviroment.getURL(api: api)
//        
//        url?.append(path: endpoint.path)
//        
//        var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false)
//        urlComponents?.query = endpoint.query
//        
//        return RouterEndpoint(path: url?.absoluteString ?? "url not found", method: endpoint.method, query: endpoint.query)
//    }
//    
//func routeGutendexEndpoint(_ endpoint: Endpoint) -> Endpoint {
//    routedEndpoint(endpoint, api: .gutendex)
//}

    private func getURI(_ endpoint: Endpoint, api: AppEnvironment.Base) -> URL? {
        
        guard let baseURL = enviroment.getURL(api: api) else { return nil }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        urlComponents?.path = endpoint.path
        urlComponents?.queryItems = [
            URLQueryItem(name: endpoint.query, value: endpoint.searchValue)
        ]
        
        return urlComponents?.url
        
    }
    
    
    
    func routeGutendexEndpoint(_ endpoint: Endpoint) -> URL? {
        guard let url = getURI(endpoint, api: .gutendex) else { return nil }
        return url
        
    }
}


