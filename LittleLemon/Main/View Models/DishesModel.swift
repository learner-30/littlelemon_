//
//  DishesModel.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/07.
//

import Foundation
import CoreData

//@MainActor
class DishesModel: ObservableObject {
    @Published var menuItems = [MenuItem]()
    
    func getMenuData(_ context:NSManagedObjectContext, completion: @escaping () -> Void) {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data)
                if let items = fullMenu?.menu {
                    DispatchQueue.main.async {
                        for menuItem in items {
                            let dish = Dish(context: context)
                            dish.title = menuItem.title
                            dish.image = menuItem.image
                            dish.price = menuItem.price
                            dish.category = menuItem.category
                        }
                        try? context.save()
                    }
                    context.perform {
                        self.menuItems = items
                        completion()
                    }
                }
            }
        }

        task.resume()
    }
}
