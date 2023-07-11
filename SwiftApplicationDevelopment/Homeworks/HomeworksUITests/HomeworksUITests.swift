//
//  HomeworksUITests.swift
//  HomeworksUITests
//
//  Created by Дмитрий Кузнецов on 11.07.2023.
//

import XCTest

final class HomeworksUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testTabClick(){
        
        let app = XCUIApplication()
        app.webViews.webViews.webViews/*@START_MENU_TOKEN@*/.buttons["Продолжить как Дмитрий +7 ··· ··· ·· 90"]/*[[".otherElements[\"VK ID\"].buttons[\"Продолжить как Дмитрий +7 ··· ··· ·· 90\"]",".buttons[\"Продолжить как Дмитрий +7 ··· ··· ·· 90\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Groups"].tap()
        tabBar.buttons["Photos"].tap()
        tabBar.buttons["My profile"].tap()
    }
}
