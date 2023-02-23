//
//  RegistrationView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 23/02/23.
//

import SwiftUI

struct RegistrationView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel:  AuthViewModel
    
    
    var body: some View {
        VStack{
            
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: { })

            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack { Spacer() }
                
                Text("Get Started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create Your Account.")
                    .foregroundColor(Color(.systemBlue))
                    .font(.largeTitle)
                    .bold()
                
                VStack(spacing: 30) {
                    
                    CustomTextField(imageName: "envelope",
                                  placeHolderText: "Email",
                                  isSecureField: false,
                                  text: $email)
                    
                    CustomTextField(imageName: "person",
                                  placeHolderText: "Username",
                                  isSecureField: false,
                                  text: $username)
                    
                    CustomTextField(imageName: "person",
                                  placeHolderText: "Full Name",
                                  isSecureField: false,
                                  text: $fullName)
                    
                    CustomTextField(imageName: "lock",
                                  placeHolderText: "Password",
                                  isSecureField: true,
                                  text: $password)
                    
                }.padding([.top ,.horizontal], 32)
                
                
                
                
            }.padding()
            
            Button(action: {
                viewModel.register(withEmail: email, password: password, fullname: fullName, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding(.horizontal)
            })
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding(.top, 20)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: { mode.wrappedValue.dismiss() }, label: {
                HStack {
                    Text("Already have an Account?")
                    
                    Text("Sign In")
                        .bold()
                }
            }).padding(.bottom, 32)
        }.preferredColorScheme(.dark)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
