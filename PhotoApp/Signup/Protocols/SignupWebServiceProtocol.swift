//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 29.08.24.
//

import Foundation


protocol SignupWebServiceProtocol {
    
    
    func  signup(withForm fromModel: SignupFromRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void )
        
    
}
