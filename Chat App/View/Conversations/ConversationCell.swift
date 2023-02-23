//
//  UserCell.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 26/02/23.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel
    
    
    var body: some View {

        if let user = viewModel.message.user {
            NavigationLink(destination: ChatsView(user: user), label: {
                VStack {
                    HStack {
                        
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                                
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                            
                        }.foregroundColor(.white)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    Divider()
                }.padding(.top)
            })
        }
            
    }
}


