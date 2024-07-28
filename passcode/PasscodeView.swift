//
//  PasscodeView.swift
//  passcode
//
//  Created by Bruno Mazzocchi on 28/7/24.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    @State private var showPasscodeError: Bool = false
    
    var body: some View {
        VStack(spacing: 48){
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Please enter your 4-digit pin to securely access your account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
            
            // Indicator view
            PasscodeIndicatorView(passcode: $passcode)
            
           
            // Number pad view
            Spacer()
            NumberPadView(passcode: $passcode)
        }
        // IOS 17 standard
        .onChange(of: passcode, {
            oldValue, newValue in
            verifyPassword()
        })
        // Older version before IOS 17
        .onChange(of: passcode, perform: {
            value in verifyPassword()
        })
    }
    
    private func verifyPassword() {
        guard passcode.count == 4 else {return}
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "1111"
            showPasscodeError = !isAuthenticated
            passcode = ""
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
