//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("first name key") var storedFirstName: String = ""
    @AppStorage("last name key") var storedLastName: String = ""
    @AppStorage("email key") var storedEmail:String  = ""
    @AppStorage("kIsLoggedIn") var storedIsLoggedIn : Bool = false
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    @State var firstNameTouched = false
    @State var lastNameTouched = false
    @State var emailTouched = false
    
    var isFirstNameValid: Bool {
        !firstName.isEmpty
    }
    
    var isLastNameValid: Bool {
        !lastName.isEmpty
    }
    
    var isEmailValid: Bool {
        let emailRegex = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES[c] %@", emailRegex).evaluate(with: email)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                VStack {
                    VStack {
                        TextField("First Name", text: $firstName, onEditingChanged: { isEditting in
                            if !isEditting { firstNameTouched = true}
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(firstNameTouched && !isFirstNameValid ? Color.red : Color.gray, lineWidth: 1))
                        
                        if firstNameTouched && !isFirstNameValid {
                            HStack {
                                Text("Required").foregroundStyle(Color.red)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 70, alignment: .top)
                    
                    VStack {
                        TextField("Last Name", text: $lastName, onEditingChanged: { isEditting in
                            if !isEditting { lastNameTouched = true}
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(lastNameTouched && !isLastNameValid ? Color.red : Color.gray, lineWidth: 1))
                        
                        if lastNameTouched && !isLastNameValid {
                            HStack {
                                Text("Required").foregroundStyle(Color.red)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 70, alignment: .top)
                    
                    VStack {
                        TextField("Email", text: $email, onEditingChanged: { isEditting in
                            if !isEditting { emailTouched = true}
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(emailTouched && !isEmailValid ? Color.red : Color.gray, lineWidth: 1))
                        .keyboardType(.emailAddress)
                        
                        if emailTouched && !isEmailValid {
                            HStack {
                                Text(email.isEmpty ? "Required" : "Invalid email").foregroundStyle(Color.red)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 70, alignment: .top)
                    
                    Button("Register") {
                        firstNameTouched = true
                        lastNameTouched = true
                        emailTouched = true
                        
                        if isFirstNameValid && isLastNameValid && isEmailValid {
                            storedFirstName = firstName
                            storedLastName = lastName
                            storedEmail = email
                            isLoggedIn = true
                            storedIsLoggedIn = isLoggedIn
                        }
                    }
                    .onAppear {
                        if storedIsLoggedIn {
                            isLoggedIn = true
                        }
//                        print(storedFirstName)
//                        print(storedLastName)
//                        print(storedEmail)
//                        print(storedIsLoggedIn)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Home()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .foregroundStyle(Color.black)
                    .background(Color.primary2)
                    .cornerRadius(8)
                }
                .padding([.top], 15)
                .padding([.leading, .trailing], 15)
                Spacer()
            }
        }
    }
}

#Preview {
    Onboarding()
}
