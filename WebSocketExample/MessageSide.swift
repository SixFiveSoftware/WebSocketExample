//
//  MessageSide.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/30/24.
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
