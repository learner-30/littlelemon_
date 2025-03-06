//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    @State var firstName = ""
    @State var lasttName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lasttName)
                TextField("Email", text: $email)
                Button("Register") {
                    if !firstName.isEmpty && !lasttName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lasttName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                    }
                }
                .navigationDestination(isPresented: $isLoggedIn) {
                    Home()
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
