//
//  Menu.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State var searchText = ""
    @State var isLoaded = false
    
    var body: some View {
        VStack {
            Header()
            VStack {
                LittleLemon()
                HStack {
                    TextField("Search menu", text: $searchText)
                        .padding(.leading, 30)
                        .padding([.top, .bottom], 10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 5)
                                Spacer()
                            }
                        )
                }
                Spacer()
            }
            .frame(height: 310)
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
            .background(Color.primary1)
            
            OrderForDelivery()
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            Text(dish.title!)
                            Spacer()
                            Text("$ " + dish.price!)
                            Spacer().frame(width: 50)
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                    ProgressView()
                                }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .onAppear {
                if !isLoaded {
                    dishesModel.getMenuData(viewContext) { }  // added { } for parameter 'completion'
                    isLoaded = true
                }
                
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

#Preview {
    Menu()
}
