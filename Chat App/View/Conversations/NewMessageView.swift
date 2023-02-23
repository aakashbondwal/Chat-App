//
//  NewMessageView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 26/02/23.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = NewMessageViewModel()
    @Binding var user: User?
    
    var body: some View {
        ScrollView {
            
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            
            
                VStack {
                    ForEach(viewModel.users) { user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }
        }
    }
}

