//
//  Header.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/08.
//

import SwiftUI

struct Header: View {
    @AppStorage("kIsLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Image("Logo")
            
            if isLoggedIn {
                HStack {
                    Spacer()
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                }
                .padding(.trailing, 10)
            }
        }
        .frame(height: 60)
//        .onAppear{print(isLoggedIn)}
    }
}

#Preview {
    Header()
}
