//
//  Menu.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    @State var isLoaded = false
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Little Lemon restaurant is ...")
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) {
                (dishes: [Dish]) in
                List {
                    TextField("Search menu", text: $searchText)
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
                    getMenuData()
                    isLoaded = true
                }
                
            }
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data)
                if let menuItems = fullMenu?.menu {
                    for menuItem in menuItems {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                    }
                    try? viewContext.save()
                }
            }
        }

        task.resume()
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
