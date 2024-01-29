//
//  LandingView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

struct LandingView: View {
    let viewModel: ViewModel
    @Binding var isInSession: Bool
    
    var body: some View {
        Button(action: {
            viewModel.start()
            isInSession = true
        }, label: {
            Text("Start Chat")
        })
    }
}

#Preview {
    LandingView(viewModel: ViewModel(), isInSession: .constant(false))
}
