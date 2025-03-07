//
//  LittleLemonTests.swift
//  LittleLemonTests
//
//  Created by Xcode on 2025/03/05.
//

import XCTest
@testable import LittleLemon

final class DishesModelTests: XCTestCase {
    func test_DishesModel_getFiveDishes() {
        let expectation = self.expectation(description: "Download dishes and update menuItems")
        let dishesModel = DishesModel()
        
        dishesModel.getMenuData(PersistenceController.shared.container.viewContext) {
            XCTAssertEqual(dishesModel.menuItems.count, 5)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
