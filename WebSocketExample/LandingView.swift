//
//  LandingView.swift
//  WebSocketExample
//
//  Created by BJ Miller on 1/29/24.
//

import SwiftUI

struct LandingView: View {
    @Binding var isInSession: Bool
    
    var body: some View {
        Button(action: {
            isInSession = true
        }, label: {
            Text("Start Chat")
        })
    }
}

#Preview {
    LandingView(isInSession: .constant(false))
}
