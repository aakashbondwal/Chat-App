//
//  LoginView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 23/02/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome Back")
                        .foregroundColor(Color(.systemBlue))
                        .font(.largeTitle)
                        .bold()
                    
                    VStack(spacing: 20) {
                        
                        CustomTextField(imageName: "envelope",
                                      placeHolderText: "Email",
                                      isSecureField: false,
                                      text: $email)
                        
                        CustomTextField(imageName: "lock",
                                      placeHolderText: "Password",
                                      isSecureField: true,
                                      text: $password)
                        
                    }.padding([.top ,.horizontal], 32)
                    
                    
                    
                    
                }.padding()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: Text("Reset Passowrd"), label:  {
                        Text("Forgot Password?")
                    })
                }.padding(.horizontal)
                
                
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                })
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                .padding(.horizontal)
                
                
                Spacer()
                
                
                NavigationLink(destination: RegistrationView()
                    .navigationBarBackButtonHidden(true),
                               label:  {
                    Text("Don't have an Account?")
                    
                    Text("Sign Up")
                        .bold()
                }).padding(.bottom, 32)
                    
            }
        }.preferredColorScheme(.dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

