//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 27.08.24.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator : SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    
    
    
    func isFerstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }

}
