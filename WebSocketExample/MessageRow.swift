//
//  MessageRow.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

enum MessageSide {
    case sent, received
    var backgroundColor: Color {
        switch self {
        case .sent: .blue
        case .received: .green
        }
    }
    var foregroundColor: Color {
        switch self {
        case .sent: .white
        case .received: .black
        }
    }
}

struct MessageRow: View {
    let side: MessageSide
    let text: String
    
    var body: some View {
        HStack {
            if side == .sent {
                Spacer(minLength: 60)
            }
            Text(text)
                .foregroundStyle(side.foregroundColor)
                .padding(12)
                .background(side.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            if side == .received {
                Spacer(minLength: 60)
            }
        }
        .padding(20)
    }
}

#Preview {
    VStack {
        MessageRow(side: .sent, text: "hello world")
        MessageRow(side: .received, text: "hey back")
        MessageRow(side: .received, text: "hey backhey backhey backhey backhey backhey backhey back")
    }
}
