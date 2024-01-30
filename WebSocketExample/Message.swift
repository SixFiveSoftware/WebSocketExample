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
}

struct MessageDetail {
    let text: String
    let timeStamp: Date
    
    var formattedDate: String {
        timeStamp.formatted(date: .abbreviated, time: .standard)
    }
}

extension Message: Identifiable {}
