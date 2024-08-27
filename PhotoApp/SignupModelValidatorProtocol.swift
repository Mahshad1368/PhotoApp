//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 27.08.24.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFerstNameValid(firstName: String) -> Bool
        
    
    func isPasswordValid(password: String) -> Bool
    
    
    func doPasswordMatch(password: String, repeatPassword: String)-> Bool
}
