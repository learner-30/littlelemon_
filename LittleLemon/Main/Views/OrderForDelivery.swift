//
//  OrderForDelivery.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/08.
//

import SwiftUI

struct OrderForDelivery: View {
    var body: some View {
        HStack(spacing: 15) {
            OrderForDeliveryButton(category: "Starters")
            OrderForDeliveryButton(category: "Mains")
            OrderForDeliveryButton(category: "Desserts")
            OrderForDeliveryButton(category: "Sides")
        }
    }
}

struct OrderForDeliveryButton: View {
    var category: String
    
    var body: some View {
        Button(category) { }
            .padding(10)
//            .font(.system(size: 18, weight: .bold))
            .font(.custom("Karla-Regular_Medium", size: 18))
            .foregroundStyle(Color.black)
            .background(Color.secondary1)
            .cornerRadius(8)
    }
}

//#Preview {
//    OrderForDeliveryButton(category: "Starters")
//}

#Preview {
    OrderForDelivery()
}
