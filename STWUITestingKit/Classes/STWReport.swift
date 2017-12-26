//
//  STWReports.swift
//  Glamour
//
//  Created by Tal Zion on 01/05/2017.
//  Copyright © 2017 Stanwood GmbH. All rights reserved.
//

import Foundation

open class STWReport {
    
    fileprivate var failures:[STWFailure] = []
    
    /// Checking if tests did pass
    var didPass: Bool {
        return failures.count == 0
    }
    
    // MARK: - Printing the STWReport
    var print: String {
        get {
            guard !didPass else { return "Test passed!" }
            var print = "\nFailed Test Cases STWReport\n\nNumber of failed tests: \(failures.count)\n\n"
            
            for item in failures.enumerated() {
                print += "\nSTWTest ID: \(item.element.testID == "0" ? "nil" : item.element.testID), \nItem ID: \(item.element.navigationID == 0 ? "nil" : "\(item.element.navigationID)"),\nFailure Message: \(item.element.errorMessage).\n\n"
            }
            return print
        }
    }
    
    // MARK: - Adding test failiures
    func test(failed item: STWFailure) {
        failures.append(item)
    }
}
