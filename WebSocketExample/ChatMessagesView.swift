//
//  ChatMessagesView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/30/24.
//

import SwiftUI

struct ChatMessagesView: View {
    let viewModel: ChatViewModel
    
    var body: some View {
        if viewModel.messages.isEmpty {
            Text("No messages!")
        } else {
            ScrollViewReader { value in
                List(viewModel.messages) { message in
                    MessageRow(message: message).id(message.id)
                }
                .onReceive(viewModel.messages.publisher, perform: { _ in
                    guard !viewModel.messages.isEmpty else { return }
                    Task {
                        value.scrollTo(viewModel.messages.last?.id, anchor: .top)
                    }
                })
            }
        }
    }
}

#Preview {
    ChatMessagesView(viewModel: ChatViewModel())
}
