//
//  User.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 27/02/23.
//

import FirebaseFirestoreSwift

struct User : Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileimageUrl: String
}

let MOCK_USER = User(id: "123213124",username: "testt", fullname: "Tesr", email: "test@gmail.com", profileimageUrl: "www.google.com")
