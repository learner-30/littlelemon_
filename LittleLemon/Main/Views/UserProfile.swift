//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

struct UserProfile: View {
    @AppStorage("first name key") var storedFirstName: String = ""
    @AppStorage("last name key") var storedLastName: String = ""
    @AppStorage("email key") var storedEmail:String  = ""
    @AppStorage("kIsLoggedIn") var storedIsLoggedIn : Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            Text("First Name : \(storedFirstName)")
            Text("Last Name : \(storedLastName)")
            Text("Email : \(storedEmail)")
            
            Spacer().frame(height: 30)
            Button("Logout") {
                storedIsLoggedIn = false
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
