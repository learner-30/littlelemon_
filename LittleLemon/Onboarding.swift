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
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                }
                .onAppear {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
//                    print(UserDefaults.standard.string(forKey: kFirstName) ?? "")
//                    print(UserDefaults.standard.string(forKey: kLastName) ?? "")
//                    print(UserDefaults.standard.string(forKey: kEmail) ?? "")
//                    print("\(UserDefaults.standard.bool(forKey: kIsLoggedIn))")
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
