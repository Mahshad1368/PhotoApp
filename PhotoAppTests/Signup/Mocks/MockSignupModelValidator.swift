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
    var isPasswordValidated: Bool = false
    var doPasswordMatched: Bool = false
    var isLastNameValidted: Bool = false
    var isValidEmailformated: Bool = false
    
    
    
    func isFerstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        
        doPasswordMatched = true
        return doPasswordMatched
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidted = true
        return isLastNameValidted
    }
    
    func isValidEmailformat(email: String) -> Bool {
        isValidEmailformated = true
        return isValidEmailformated
    }

}
