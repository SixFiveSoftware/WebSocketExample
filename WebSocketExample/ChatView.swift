//
//  ChatView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

struct ChatView: View {
    let viewModel: ViewModel
    @Binding var isInSession: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // set some state
                    viewModel.close()
                    isInSession = false
                }, label: {
                    Text("end chat")
                })
                .padding(.trailing)
            }
        }
        Spacer()
    }
}

#Preview {
    ChatView(viewModel: ViewModel(), isInSession: .constant(true))
}
