//
//  ContentView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isInSession = false
    
    var body: some View {
        if isInSession {
            ChatView(viewModel: ChatViewModel(), isInSession: $isInSession)
        } else {
            LandingView(isInSession: $isInSession)
        }
    }
}

#Preview {
    ContentView()
}
