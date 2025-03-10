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
    @State var selectedCategory = ""
    @State var isLoaded = false
    
    var body: some View {
        VStack {
            Header()
            VStack {
                LittleLemon()
                HStack {
                    TextField("Search menu", text: $searchText)
//                        .onChange(of: searchText) {
//                            print(searchText)
//                        }
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
            
            HStack {
                Text("ORDER FOR DELIVERY")
                    .font(.weekSpecialSection)
                Spacer()
            }
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 15)
            
            OrderForDelivery(selectedCategory: $selectedCategory)
            
            Divider()
            
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
                .listStyle(.plain)
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
        var predicate1 = NSPredicate(value: true)
        var predicate2 = NSPredicate(value: true)
        
        if !selectedCategory.isEmpty {
            predicate1 = NSPredicate(format: "category == %@", selectedCategory)
        }
        if !searchText.isEmpty {
            predicate2 = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        return NSCompoundPredicate(
            type: .and,
            subpredicates: [predicate1, predicate2]
        )
    }
}

#Preview {
    Menu()
}
