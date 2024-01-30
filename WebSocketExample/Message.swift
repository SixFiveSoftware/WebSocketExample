//
//  Message.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/30/24.
//

import Foundation

struct Message {
    let id = UUID()
    let side: MessageSide
    let messageDetail: MessageDetail
    
    var isUserMessage: Bool {
        let regex = /Request served by [0-9a-f]{14}/
        return messageDetail.text.contains(regex) == false
    }
}

struct MessageDetail {
    let text: String
    let timeStamp: Date
    
    var formattedDate: String {
        timeStamp.formatted(date: .abbreviated, time: .standard)
    }
}

extension Message: Identifiable {}
