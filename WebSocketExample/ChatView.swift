//
//  ChatView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

struct ChatView: View {
    let viewModel: ChatViewModel
    @Binding var isInSession: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // set some state
                        viewModel.stop()
                        isInSession = false
                    }, label: {
                        Text("end chat")
                    })
                    .padding(.trailing)
                }
            }
            Spacer()
        }
        .onAppear {
            viewModel.start()
        }
    }
}

@Observable final class ChatViewModel {
    let socketManager: WebSocketManager
    
    init(socketManager: WebSocketManager = WebSocketManager()) {
        self.socketManager = socketManager
    }
    
    func stop() {
        socketManager.close()
    }
    
    func start() {
        socketManager.start()
    }
}

#Preview {
    ChatView(viewModel: ChatViewModel(), isInSession: .constant(true))
}
