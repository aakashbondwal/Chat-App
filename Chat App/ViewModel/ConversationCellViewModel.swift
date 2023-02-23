//
//  ConversationCellViewModel.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 27/02/23.
//

import SwiftUI

class ConversationCellViewModel: ObservableObject {
    @Published var  message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else{ return nil}
        return URL(string: user.profileimageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else{ return "" }
        return user.fullname
    }
    
    func fetchUser() {
        
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
}
