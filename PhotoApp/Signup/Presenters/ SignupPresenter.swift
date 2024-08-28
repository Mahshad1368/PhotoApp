//
//   SignupPresenter.swift
//  PhotoApp
//
//  Created by Mahshad Jafari on 27.08.24.
//

import Foundation

class  SignupPresenter {
    
    
    private var formModelVAlidator: SignupModelValidatorProtocol
    
    init(formModelVAlidator: SignupModelValidatorProtocol){
        self.formModelVAlidator = formModelVAlidator
    }
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelVAlidator.isFerstNameValid(firstName: formModel.firstName) {
            
            return
        }
        if !(formModelVAlidator.isPasswordValid(password: formModel.password)) {
            
            return
        }
        
        if !(formModelVAlidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword)){
            return
        }
        
    }
}
