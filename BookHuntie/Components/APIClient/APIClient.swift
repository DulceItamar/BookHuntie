//
//  APIClient.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 18/06/24.
//

import Foundation

final class APIClient {
   private  let router = Router()
    private let requester = Requester()
    private let parser = Parser()
    
    
    func apiClient(parameter: String) async throws-> BookResponse {
        
        let endpoint = GetBookDataEndpoint(searchValue: parameter.lowercased())
        print(endpoint)
        
        guard let url = router.routeGutendexEndpoint(endpoint) else { throw NetworkError.invalidURL
        }
        
        let data = try await requester.execute(with: endpoint, with: url)
        
        
        guard let bookResponse = parser.parse(data, type: BookResponse.self, decoder: JSONDecoder()) else {
            throw NetworkError.decodingFailed
        }
        return bookResponse
        
//        var books = bookResponse.results
//        print(books)
//        print("Count: \(books.count)")
//        return books
        
    }
}


enum NetworkError : Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}


class ErrorManagement {
    
    func errorsManagement( error: NetworkError)  {
        switch error {
            case .invalidURL:
                print("Error: invalid URL.")
            case .requestFailed:
                print("Error: Failed Request")
            case .decodingFailed:
                print("Error: Fail decoding data")
        }
    }
}
