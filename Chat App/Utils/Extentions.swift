//
//  Extentions.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 26/02/23.
//


//extention for end editing in search bar and dismiss the keyboard


import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


