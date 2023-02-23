//
//  SettingsHeaderView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 25/02/23.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    private let user : User
    
    init (user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(spacing:32) {
            HStack {
                KFImage(URL(string: user.profileimageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname)
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    Text("Available")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }.frame(height: 80)
                .background(Color(.systemGray6))
                .padding(.top, 20)
            
            
        }.preferredColorScheme(.dark)
    }
}

