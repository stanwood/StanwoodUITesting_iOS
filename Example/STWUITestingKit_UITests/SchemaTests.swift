//
//  STWSchemaTests.swift
//  STWUITestingKit
//
//  Created by Tal Zion on 04/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import STWUITestingKit

class STWSchemaTests: XCTestCase {
    
    let app = XCUIApplication()
    
    /// Based on JSONSTWSchema draft4 tempalte
    let url = "https://dl.dropboxusercontent.com/s/qbfgngc7bzuq3s5/test_chema.json"
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        guard let url = URL(string: url) else { return }
        let launchHandlers: [LaunchHandlers] = [.notification, .review, .default]
        
        let tool = STWTestConfigurations(url: url, launchHandlers: launchHandlers, app: app)
        
        UITestingManager.shared.setup(tool: tool)
        
        UITestingManager.shared.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSTWSchema(){
        UITestingManager.shared.runTests()
    }
    
}