//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 27.08.24.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        signupFormModel = SignupFormModel(firstName: "Mahshad", lastName: "Jafari", email: "test@test.com", password: "123456789", repeatPassword:  "123456789")
        
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelVAlidator: mockSignupModelValidator, webService: mockSignupWebService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        
    }
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "Firs name was not validatet")
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "Last name was not validatet")
        XCTAssertTrue(mockSignupModelValidator.isValidEmailformated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.doPasswordMatched, "Did not validated if passwords match")
    }
    
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        //Act
        let sut = SignupPresenter(formModelVAlidator: mockSignupModelValidator, webService: mockSignupWebService)
        sut.processUserSignup(formModel: signupFormModel)
        
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
        
    }
}
