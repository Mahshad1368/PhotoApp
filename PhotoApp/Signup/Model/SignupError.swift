//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 21.08.24.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    
    var errorDescription : String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
    
}
