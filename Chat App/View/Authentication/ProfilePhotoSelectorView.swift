//
//  ProfilePhotoSelectorView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 27/02/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack {
            Button(action: { imagePickerPresented.toggle() }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.white)
                }
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss:  loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ? "Select a Profile Picture" : "Great! Tap below to continue")
                .font(.system(size: 20, weight: .semibold))
                .padding()
            
            if let image =  selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(image)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                .padding(.top, 24)
            }
            
            Spacer()
        }.preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
