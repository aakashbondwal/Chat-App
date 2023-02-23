//
//  EditProfileView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 25/02/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private  var fullname = "Aakash Bondwal"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack {
          Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                //header

                VStack {
                    //photo/edit button/ text
                    
                    HStack {
                        //photo/ edit button
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image("venom-7")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                            })
                            .sheet(isPresented: $showImagePicker,onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }
                        }.padding(.top)
                        

                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding(8)
                        
                        
                    
                }
                .background(Color(.systemGray6))
                .padding(.top)
                
                //status
                
                VStack(alignment: .leading) {
                    
                    //status text
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    //status
                    
                    NavigationLink(destination: { StatusSelectorView() }, label: {
                        HStack {
                            Text("At the movies")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }.padding()
                            .background(Color(.systemGray6))
                    })
                }
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
