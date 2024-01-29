//
//  ContentView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isInSession = false
    let viewModel = ViewModel()
    
    var body: some View {
        if isInSession {
            ChatView(viewModel: viewModel, isInSession: $isInSession)
        } else {
            LandingView(viewModel: viewModel, isInSession: $isInSession)
        }
    }
}

#Preview {
    ContentView()
}
