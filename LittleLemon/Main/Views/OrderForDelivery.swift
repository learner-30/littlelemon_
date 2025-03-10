//
//  OrderForDelivery.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/08.
//

import SwiftUI

struct OrderForDelivery: View {
    @Binding var selectedCategory: String
    let categories = ["starters", "mains", "desserts"]
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                OrderForDeliveryButton(category: category, selectedCategory: $selectedCategory)
                Spacer()
            }
            OrderForDeliveryButton(category: "sides", selectedCategory: $selectedCategory)
        }
        .padding([.leading, .trailing], 15)
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
            .font(.weekSpecialSection)
            .foregroundStyle(selectedCategory == category ? Color.white : Color.black)
            .background(selectedCategory == category ? Color.primary1 : Color.secondary1)
            .cornerRadius(8)
    }
}

//#Preview {
//    OrderForDeliveryButton(category: "starters", selectedCategory: .constant(""))
//    OrderForDeliveryButton(category: "starters", selectedCategory: .constant("starters"))
//}

#Preview {
    OrderForDelivery(selectedCategory: .constant(""))
}
