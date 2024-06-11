//
//  EndPoint.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 08/06/24.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var query: String { get }
    var searchValue: String? { get }
}

enum HTTPMethod:String {
    case GET
}




struct GetBookDataEndpoint: Endpoint {
    var path: String = "/books/"
    var method: HTTPMethod = .GET
    var query: String = "search"
    var searchValue: String?
    
}



enum GutendexEndpoints {
    case getBookData
 
    public var endpoint: Endpoint {
        switch self {
            case .getBookData:
                return GetBookDataEndpoint()
        }
    }
}


