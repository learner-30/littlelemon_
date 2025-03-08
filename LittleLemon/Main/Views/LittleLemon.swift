//
//  LittleLemon.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/08.
//

import SwiftUI

struct LittleLemon: View {
    var body: some View {
        VStack {
            HStack {
                Text("Little Lemon")
                    .foregroundStyle(Color.primary2)
                    .font(.custom("MarkaziText-Medium", size: 64))
                Spacer()
            }
            Spacer().frame(height: 0)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Chicago")
                            .foregroundStyle(Color.white)
                            .font(.custom("MarkaziText-Regular", size: 40))
                        Spacer()
                    }
                    Text(
                        """
                        We are a family owned 
                        Mediterranean restaurant, 
                        focused on traditional 
                        recipes served with a
                        modern twist
                        """
                    )
                    .foregroundStyle(Color.white)
                    .font(.custom("Karla-Regular_Medium", size: 18))
                }
                Image("Hero-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(height: 170)
            Spacer()
        }
        .frame(height: 270)
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 15)
        .background(Color.primary1)
    }
}

#Preview {
    LittleLemon()
}
