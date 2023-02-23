//
//  Message.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 26/02/23.
//
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable {
    @DocumentID var id : String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp : Timestamp
    
    var user: User?
}

