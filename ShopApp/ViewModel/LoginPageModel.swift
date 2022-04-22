//
//  LoginPageModel.swift
//  ShopApp
//
//  Created by Evgeny on 1.12.21.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    //Login properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    //Log Status...
    @AppStorage("log_Status") var log_Status: Bool = false
    
    //Login call
    func Login() {
        withAnimation {
            log_Status = true
        }
    }
    func Register() {
        // Do action here
        withAnimation {
            log_Status = true
        }
    }
    func ForgetPassword() {
        // Do action here
    }
}
  
