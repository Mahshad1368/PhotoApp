//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Mahshad Jafari on 28.08.24.
//

import Foundation
@testable import PhotoApp



class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm fromModel: PhotoApp.SignupFromRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
    }
    

}
