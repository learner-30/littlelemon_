//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            Text("First Name : \(firstName)")
            Text("Last Name : \(lastName)")
            Text("Email : \(email)")
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
