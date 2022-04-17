//
//  TestIgnoreDelimitersInLastField.swift
//  
//
//  Created by Jon Lidgard on 17/04/2022.
//

import XCTest
import CodableCSV


class MyCustomTests: XCTestCase {
  override func setUp() {
    self.continueAfterFailure = false
  }
}


extension MyCustomTests {
  
  func testIgnoreExtraDelimitersInLastField() throws {
    let input = """
  a,b
  §,B,C
  """
    XCTAssertNoThrow(try CSVReader.decode(input: input) {
      $0.headerStrategy = .firstLine
      $0.ignoreDelimitersInLastFieldStrategy = .ignore()
    })
  }
}
