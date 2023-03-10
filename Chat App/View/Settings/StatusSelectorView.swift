//
//  StatusSelectorView.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 25/02/23.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                        
                    StatusCell(status: viewModel.status )
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    //for loop with options
                    
                    ForEach(userStatus.allCases.filter({ $0 != .notConfigured }), id: \.self ) { status in
                        Button(action: {
                            viewModel.updateStatus(status)
                        }, label: {
                            StatusCell(status: status)
                        })
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: userStatus
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color(.systemGray6))
        
    }
}
