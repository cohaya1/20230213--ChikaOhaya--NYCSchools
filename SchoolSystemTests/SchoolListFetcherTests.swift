//
//  SchoolListFetcherTests.swift
//  SchoolSystemTests
//
//  Created by Chika Ohaya on 2/13/23.
//

import XCTest
@testable import SchoolSystem

final class SchoolListsFetcherTests: XCTestCase {
    
    
    var sut: NetworkManager!
    
     override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = NetworkManager()
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testGetAllSchoolsSuccess() async {
        let expectation = XCTestExpectation(description: "schools fetched successfully")
        
        
            do {
                let schools = try await self.sut.getAllSchools()
                
                XCTAssertNotNil(schools)
                print(XCTAssertGreaterThan(schools.count, 0))
                
                expectation.fulfill()
            } catch {
                XCTFail("Error: \(error)")
            }
        wait(for: [expectation], timeout: 5.0)
        }
        
        
    }

