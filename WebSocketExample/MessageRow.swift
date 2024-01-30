//
//  MessageRow.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        VStack {
            HStack {
                if message.side == .sent {
                    Spacer(minLength: 60)
                }
                Text(message.messageDetail.text)
                    .foregroundStyle(message.side.foregroundColor)
                    .padding(12)
                    .background(message.side.backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                if message.side == .received {
                    Spacer(minLength: 60)
                }
            }
            HStack {
                if message.side == .sent {
                    Spacer(minLength: 60)
                }
                Text(message.messageDetail.formattedDate)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                if message.side == .received {
                    Spacer(minLength: 60)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    VStack {
        MessageRow(message: .init(side: .sent, messageDetail: .init(text: "hello world", timeStamp: Date())))
        MessageRow(message: .init(side: .received, messageDetail: .init(text: "hey back", timeStamp: Date())))
        MessageRow(message: .init(side: .received, messageDetail: .init(text: "hey backhey backhey backhey backhey backhey backhey back", timeStamp: Date())))
    }
}
