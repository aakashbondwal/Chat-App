//
//  ConversationViewModel.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 27/02/23.
//

import SwiftUI

class ConservationViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
            query.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.recentMessages = documents.compactMap( {try? $0.data(as: Message.self)} )
            
        }
    }
}
