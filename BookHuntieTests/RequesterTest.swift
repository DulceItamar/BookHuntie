//
//  RequesterTest.swift
//  BookHuntieTests
//
//  Created by Dulce Itamar Vigueras Ballesteros on 11/06/24.
//

import XCTest
@testable import BookHuntie

final class RequesterTest: XCTestCase {
    let router = Router()
    let network = Requester()
    let parser = Parser()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestData() async throws {
        

        let endpoint = GetBookDataEndpoint(searchValue: "austen jane")
        
        if let url = router.routeGutendexEndpoint(endpoint) {
            let data = try await network.execute(with: endpoint, with: url)
            
            XCTAssertNotNil(data, "Data is not nil")
        }
    }
    
    func testFetchDataSpecificBook() async throws {
        let endpoint = GetBookDataEndpoint(searchValue: "pride and prejudice")
        if let url = router.routeGutendexEndpoint(endpoint) {
            let data = try await network.execute(with: endpoint, with: url)
            
            
            if let book = parser.parse(data, type: BookModel.self, decoder: JSONDecoder()) {
                XCTAssertEqual(book.title, "Pride and Prejudice")
                XCTAssertEqual(book.downloadCount, 63731)
                //XCTAssertEqual(book.image, "https://www.gutenberg.org/cache/epub/158/pg158.cover.medium.jpg")
                
                if let author = book.author.first {
                    XCTAssertEqual(author.name, "Austen, Jane")
                    XCTAssertEqual(author.birthYear, 1775)
                    XCTAssertEqual(author.deathYear, 1817)
                }
                
                if let language = book.language.first {
                    XCTAssertEqual(language, "en")
                }
            }
           
           
            
            
            
            
            
            
            
        }
    }
    
    func testFetchDatakeyWord() async throws {
        let endpoint = GetBookDataEndpoint(searchValue: "pride")
        if let url = router.routeGutendexEndpoint(endpoint) {
            let data = try await network.execute(with: endpoint, with: url)
            
             let response = parser.parse(data, type: BookResponse.self, decoder: JSONDecoder())
            
            guard let allBooks = response?.results else { return }
        
           
           
            
            XCTAssertTrue(((response?.results.count) != nil))
            
            XCTAssertTrue(allBooks.count > 1)
            
           
            
            
            
            
            
            
            
        }
    }
    
    func testFetchImageType() async throws {
        let endpoint = GetBookDataEndpoint(searchValue: "pride")
        guard let url = router.routeGutendexEndpoint(endpoint) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
           
            if let _ = error {
                print("Error")
            }
            
            do {
                
                
                guard let data = data else { return }
                
                let decodedData = try JSONDecoder().decode(BookResponse.self, from: data)
             
                XCTAssertTrue(!decodedData.results.isEmpty)
          
            } catch {
                print("Error with the data")
            }
        }
             
            
    }


}
