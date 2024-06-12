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
    
    func testFetchData() async throws {
        let endpoint = GetBookDataEndpoint(searchValue: "pride and prejudice")
        if let url = router.routeGutendexEndpoint(endpoint) {
            let data = try await network.execute(with: endpoint, with: url)
            
            
            if let book = parser.parse(data, type: BookModel.self, decoder: JSONDecoder()) {
                XCTAssertEqual(book.title, "Pride and Prejudice")
                XCTAssertEqual(book.downloadCount, 63731)
                XCTAssertEqual(book.image, "https://www.gutenberg.org/cache/epub/158/pg158.cover.medium.jpg")
                
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

}
