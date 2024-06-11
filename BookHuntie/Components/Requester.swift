//
//  Requester.swift
//  BookHuntie
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/06/24.
//

import Foundation

protocol RequesterProtocol {
//    func execute( with endpoint: Endpoint,with uri: URL,  completionBlock: @escaping(Result<Data, Error>) -> ())
    
    func execute(with endpoint: Endpoint,with uri: URL) async throws -> Data
}

final class Requester: RequesterProtocol {

    
    
    private let urlSeesion : URLSession
    init(urlSeesion: URLSession = URLSession.shared) {
        self.urlSeesion = urlSeesion
    }
    
    
    private func buildURLRequest(uri: URL, endpoint: Endpoint) -> URLRequest? {
        
        var urlRequest = URLRequest(url: uri)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        
        return urlRequest
        
    }
    
    func execute(with endpoint: any Endpoint, with uri: URL) async throws -> Data {
        let urlRequest = buildURLRequest(uri: uri, endpoint: endpoint)!
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return data
    }
    
//    func execute(with endpoint: Endpoint, with uri: URL, completionBlock: @escaping (Result<Data, any Error>) -> ()) {
//        
//        let urlRequest = buildURLRequest(uri: uri, endpoint: endpoint)!
//        let task = urlSeesion.dataTask(with: urlRequest) {
//            data, response, error in
//            guard let error = error else {
//                completionBlock(.success(data!))
//                return
//            }
//            completionBlock(.failure(error))
//        }
//        task.resume()
//     
//       
//    }
//    

    
}
