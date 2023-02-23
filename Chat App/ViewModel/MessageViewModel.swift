//
//  MessageViewModel.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 27/02/23.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    
    init(_ message: Message) {
        self.message = message
        
    }
    
    var currentUid: String{
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.self.profileimageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
    

}
