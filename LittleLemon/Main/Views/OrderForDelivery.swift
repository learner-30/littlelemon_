//
//  OrderForDelivery.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/08.
//

import SwiftUI

struct OrderForDelivery: View {
    @Binding var selectedCategory: String
    
    var body: some View {
        HStack(spacing: 15) {
            OrderForDeliveryButton(category: "starters", selectedCategory: $selectedCategory)
            OrderForDeliveryButton(category: "mains", selectedCategory: $selectedCategory)
            OrderForDeliveryButton(category: "desserts", selectedCategory: $selectedCategory)
            OrderForDeliveryButton(category: "sides", selectedCategory: $selectedCategory)
        }
    }
}

struct OrderForDeliveryButton: View {
    var category: String
    @Binding var selectedCategory: String
    
    var body: some View {
        Button(category.capitalized) {
            if selectedCategory == category {
                selectedCategory = ""
            } else {
                selectedCategory = category
            }
        }
            .padding(10)
//            .font(.system(size: 18, weight: .bold))
            .font(.custom("Karla-Regular_Medium", size: 18))
            .foregroundStyle(selectedCategory == category ? Color.white : Color.black)
            .background(selectedCategory == category ? Color.primary1 : Color.secondary1)
            .cornerRadius(8)
    }
}

#Preview {
    OrderForDeliveryButton(category: "starters", selectedCategory: .constant(""))
    OrderForDeliveryButton(category: "starters", selectedCategory: .constant("starters"))
}

//#Preview {
//    OrderForDelivery()
//}
