//
//  StatusViewModel.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 25/02/23.
//

import Foundation
import SwiftUI


class StatusViewModel: ObservableObject {
    @Published var status: userStatus = .notConfigured
    
    func updateStatus(_ status: userStatus ) {
        self.status = status
    }
}

enum userStatus: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batterylow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        
        switch self {
            
        case .notConfigured:
            return "Click here to update your status"
        case .available:
            return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "School"
        case .movies:
            return "Movies"
        case .work:
            return  "Work"
        case .batterylow:
            return "Battery Low"
        case .meeting:
            return "Meeting"
        case .gym:
            return "Gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallsOnly:
            return "Urgent Calls Only"
            
        }
        
    }
}
