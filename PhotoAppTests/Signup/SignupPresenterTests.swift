//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 27.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Arrange
        let signupFormModel = SignupFormModel(firstName: "Mahshad", lastName: "Jafari", email: "test@test.com", password: "123456789", repeatPassword:  "123456789")
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter()
        
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
    }
}
