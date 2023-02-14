//
//  SchoolListViewModelTests2.swift
//  SchoolSystemTests
//
//  Created by Chika Ohaya on 2/14/23.
//
@testable import SchoolSystem
import XCTest

final class SchoolListViewModelTests2: XCTestCase {
    
    var sut: SchoolListFetcher!
    var mockFetchAPI: MockFetchAPI!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockFetchAPI = MockFetchAPI()
        sut = SchoolListFetcher(service: mockFetchAPI)
    }
    
    override func tearDownWithError() throws {
        mockFetchAPI = nil
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor func testSuccess() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let mockFetchAPI = MockFetchAPI()
        mockFetchAPI.result = Result.success([SchoolsDataModel(dbn: "123", schoolName: "Test School", numOfSatTestTakers: "100", satCriticalReadingAvgScore: "200", satMathAvgScore: "300", satWritingAvgScore: "400")])
        
        // When
        await sut.getAllSchools()
        
        // Then
        XCTAssertEqual(sut.schools.count, 0)
        XCTAssertEqual(sut.schools.first?.schoolName, "Test School")
    }
    
    // given more time will like to figure why my test is failing even though Data is returning in the view.
    @MainActor  func testGetAllSchoolsFailure() async {
        // Given
        mockFetchAPI.result = Result.failure(StatusCodes.failure)
        
        // When
         await sut.getAllSchools()
         
        // Then
        XCTAssertEqual(sut.schools.count, 0)
    }
}
class MockFetchAPI: FetchAPI {
    func handleNoInternetConnection() {
        
    }
    
    var result: Result<[SchoolsDataModel], Error>!
    
    func getAllSchools() async throws -> [SchoolsDataModel] {
        switch result {
        case .success(let schools):
            return schools
        case .failure(let error):
            throw error
        case .none: throw StatusCodes.failure
            
        }
    }
}
