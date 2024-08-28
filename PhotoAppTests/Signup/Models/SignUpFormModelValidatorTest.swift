//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 21.08.24.
//

import XCTest
@testable import PhotoApp

final class SignUpFormModelValidatorTest: XCTestCase {

    var sut: SignUpFormModelValidator!
    
    override func setUpWithError() throws {
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = SignUpFormModelValidator()
        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

          }

    override func tearDownWithError() throws {
        
        sut = nil
    }

    
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arange
//        let sut = SignUpFormModelValidator()
        
        // Act
       let isFirstNameValid =  sut.isFerstNameValid(firstName: "Mahshad")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
        
    }
    
    func testSignUpFormModelValidator_WhenTooShortFirstNameProvideed_ShouldReturnFalse() {
        
        // Arange
//        let sut = SignUpFormModelValidator()
        
        // Act
        let isFirstNameValid = sut.isFerstNameValid(firstName: "M")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNAmeValid() should have returned FALSE for a first name that is shorter than \(SignUpConstsnts.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenToolongFirstNameProvided_ShouldReturnedFalse() {
        
        let isFirstNameValid = sut.isFerstNameValid(firstName: "MahshadMahshad")
        
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignUpConstsnts.firstNameMaxLength) charachters but it has returned TRUE")
    }
   
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
           
           // Arrange
           // Act
           let isLastNameValid = sut.isLastNameValid(lastName: "Jafari")
           
           // Assert
           XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
       }
    
    func testSignFormModelValidator_WhenTooShortLastName_ShouldReturnesFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "j")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than  characters but it has returned TRUE")
        
    }
    
    func testSignFormModelValidator_WhenTooLongtLastName_ShouldReturnesFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "JafariJafari")
        
        XCTAssertFalse(isLastNameValid)
        
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        let isValidEmailFormat = sut.isValidEmailformat(email: "test@test.com")
        
        XCTAssert(isValidEmailFormat)
    }
    
    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        
        let isVlidEmailFormat = sut.isValidEmailformat(email: "test@test")
        
        XCTAssertFalse(isVlidEmailFormat)
    }
    
    func testSignUpFormModelValidator_WhenPasswordProvided_ShouldReturnTrue() {
        
        let isPasswordValid = sut.isPasswordValid(password: "123456789")
        
        XCTAssertTrue(isPasswordValid, "The Password provided")
        
    }
    
    func testSignUpFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignUpConstsnts.passwordMinLength) but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        let isPasswordValid = sut.isPasswordValid(password: "123456789123456789")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignUpConstsnts.passwordMaxLength) but it has returned TRUE")
        
    }
    
    func testSignUpFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "123456789", repeatPassword: "123456789")
        
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for matching passwords but it has returned FALSE")
        
    }
    
    func testSignUpFormModelValidator_WhenNotMatchPasswordProvided_ShouldReturnedFalse() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "123456789", repeatPassword: "12346789")
        
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned False for password that do not match but it has returned TRUE")
    }
    
}
