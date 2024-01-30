//
//  ChatView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import Combine
import SwiftUI

struct ChatView: View {
    let viewModel: ChatViewModel
    @Binding var isInSession: Bool
    @State private var messageToSend: String = ""
    
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
            
            if viewModel.messages.isEmpty {
                Text("No messages!")
            } else {
                List {
                    ForEach(viewModel.messages) { message in
                        MessageRow(message: message)
                    }
                }
            }
            
            Spacer()
            Divider()
            HStack(spacing: 12) {
                TextField("Type a message", text: $messageToSend)
                    .frame(height: 50)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    viewModel.send(text: messageToSend)
                    messageToSend = ""
                }, label: {
                    Text("Send")
                })
            }
            .padding()
        }
        .onAppear {
            viewModel.start()
        }
    }
}

@Observable final class ChatViewModel {
    let socketManager: WebSocketManager
    var messages: [Message] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init(socketManager: WebSocketManager = WebSocketManager()) {
        self.socketManager = socketManager
        
        socketManager.subject
            .filter(\.isUserMessage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in self?.messages.append(message) }
            .store(in: &cancellables)
    }
    
    func stop() {
        socketManager.close()
    }
    
    func start() {
        socketManager.start()
    }
    
    func send(text: String) {
        let message = Message(side: .sent, messageDetail: .init(text: text, timeStamp: .now))
        socketManager.send(message: text)
        messages.append(message)
    }
}

#Preview {
    ChatView(viewModel: ChatViewModel(), isInSession: .constant(true))
}
