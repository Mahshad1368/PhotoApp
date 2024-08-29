//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 21.08.24.
//

import Foundation

class SignUpWebService: SignupWebServiceProtocol {
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    
    func  signup(withForm fromModel: SignupFromRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void ) {
        guard let url = URL(string: urlString) else {
            
            // TODO: Create a unit test that a specific error message is returned is URL is nil
            completionHandler(nil, SignupError.invalidRequestURLString)
            
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(fromModel)
        
      let dataTask = urlSession.dataTask(with: request) {(data,response,error) in
          
          if let requestError = error {
              completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
              return
          }

          if let data = data ,
             let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data){
              completionHandler(signupResponseModel, nil)
          }else {
              //  TODO: Create a new Unit Test to handle an error here
              
              completionHandler(nil, SignupError.invalidResponseModel)
          }
        }
        dataTask.resume()
        
    }
}
