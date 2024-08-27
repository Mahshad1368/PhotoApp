//
//  SignUpPasswordValid.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 21.08.24.
//

import Foundation

class SignUpPasswordValid {
    
    
    
    
    func isPasswordValid(password: String) -> Bool {
        var returnPassword = true
        
        if password.count < SignUpConstsnts.firstNameMinLength || password.count > SignUpConstsnts.firstNameMaxLength {
            
        }
         return returnPassword
    }
}
