//
//  EndpointTest.swift
//  BookHuntieTests
//
//  Created by Dulce Itamar Vigueras Ballesteros on 10/06/24.
//

import XCTest
@testable import BookHuntie

final class EndpointTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRouterGutendexEndpoint(){
        let environment = AppEnvironment()
        let router = Router(enviroment: environment)
        
        //let endpoint = GetBookDataEndpoint(searchValue: "swift")
        let endpoint2 = GetBookDataEndpoint(searchValue: "swift project")
        
        guard let url = router.routeGutendexEndpoint(endpoint2) else {
            XCTFail("URL shoud not be nil ")
            return
        }
      
        //XCTAssertEqual(url.absoluteString, "https://gutendex.com/books/?search=swift")
        XCTAssertEqual(url.absoluteString, "https://gutendex.com/books/?search=swift%20project")
                
    }





}
