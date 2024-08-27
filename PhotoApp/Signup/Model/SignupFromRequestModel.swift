//
//  SignupFromRequestModel.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 21.08.24.
//

import Foundation

struct SignupFromRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
