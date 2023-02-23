//
//  ChatsView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 24/02/23.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel:  ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            //messages
            ScrollView {
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) {message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
                .background(Color(.systemGray6))
        }.navigationTitle(user.username)
            .background(
                Image("backgroundImage")
                .resizable()
                .scaledToFill())
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            
        }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

