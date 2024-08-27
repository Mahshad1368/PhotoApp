//
//  SignUpFormModelValidator.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 21.08.24.
//

import Foundation


class SignUpFormModelValidator : SignupModelValidatorProtocol {
    
    
    func isFerstNameValid(firstName: String) -> Bool {
        
        var returnValue = true
        
        if firstName.count < SignUpConstsnts.firstNameMinLength || firstName.count > SignUpConstsnts.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
        
    }
    func isPasswordValid(password: String) -> Bool {
       
        if password.count < SignUpConstsnts.passwordMinLength || password.count > SignUpConstsnts.passwordMaxLength {
            return false
        }
         return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String)-> Bool {
        return password == repeatPassword
    }
    
}
