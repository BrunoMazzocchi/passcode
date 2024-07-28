//
//  ContentView.swift
//  passcode
//
//  Created by Bruno Mazzocchi on 28/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!")
                    
                    Button("Log Out") {
                        isAuthenticated = false
                    }
                }
            } else {
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
