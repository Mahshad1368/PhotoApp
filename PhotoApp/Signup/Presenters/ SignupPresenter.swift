//
//   SignupPresenter.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 27.08.24.
//

import Foundation

class  SignupPresenter {
    
    
    private var formModelVAlidator: SignupModelValidatorProtocol
    
    private var webService: SignupWebServiceProtocol
    
    
    
    init(formModelVAlidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol){
        self.formModelVAlidator = formModelVAlidator
        self.webService = webService
    }
    
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelVAlidator.isFerstNameValid(firstName: formModel.firstName) {
            
            return
        }
        
        if !formModelVAlidator.isLastNameValid(lastName: formModel.lastName){
            
            return
        }
        
        if !formModelVAlidator.isValidEmailformat(email: formModel.email) {
             return
        }
        
        
        if !(formModelVAlidator.isPasswordValid(password: formModel.password)) {
            
            return
        }
        
        if !(formModelVAlidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword)){
            return
        }
        
        let requestModel = SignupFromRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { (requestModel, error) in
            // TODO
        }
    }
}
