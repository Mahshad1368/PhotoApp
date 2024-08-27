//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 21.08.24.
//

import XCTest
@testable import PhotoApp


final class SignUpWebServiceTests: XCTestCase {
    
    var sut:SignUpWebService!
    var signFormRequestModel:SignupFromRequestModel!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
         sut = SignUpWebService(urlSession: urlSession, urlString: SignUpConstsnts.signupURLString)
        
        signFormRequestModel = SignupFromRequestModel(firstName: "Mahshad", lastName: "Jafari", email: "test@test.com", password: "123456789")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        
    }
    
    func testSignUpWebService_WhenGivenSuccessfulRespond_ReturnSauccess () {
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        
        let sut = SignUpWebService(urlSession: urlSession, urlString: SignUpConstsnts.signupURLString)
        
        let signFormRequestModel = SignupFromRequestModel(firstName: "Mahshad", lastName: "Jafari", email: "test@test.com", password: "123456789")
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponsetModel, error) in
            // Assert
            // "{\"status\":\"ok\"}"
            print("Completion block executed")
            XCTAssertEqual(signupResponsetModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    
    func testSignUpWebService_whenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        
        let sut = SignUpWebService(urlSession: urlSession, urlString: SignUpConstsnts.signupURLString)
        
        let signFormRequestModel = SignupFromRequestModel(firstName: "Mahshad", lastName: "Jafari", email: "test@test.com", password: "123456789")
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON stracture")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponsetModel, error) in
            // Assert
            //   "{\"status\":\"ok\"}"
            XCTAssertNil(signupResponsetModel, " The response model for a containing unknown JSON response, should have been nil ")
            XCTAssertEqual(error, SignupError.invalidResponseModel, " The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignUpWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description:" A failed Request expectation")
        let errorDescription = "A Localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "The signup() method did not return an expecter error for thr Failed Request")
//            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
   
        
        self.wait(for: [expectation], timeout: 2)
        
    }
   
}
