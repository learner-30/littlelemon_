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
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            Text("First Name : \(firstName)")
            Text("Last Name : \(lastName)")
            Text("Email : \(email)")
            
            Spacer().frame(height: 30)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                dismiss()
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .foregroundStyle(Color.black)
            .background(Color.primary2)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding([.leading, .trailing], 15)
    }
}

#Preview {
    UserProfile()
}
