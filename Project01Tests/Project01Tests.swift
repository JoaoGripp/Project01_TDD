//
//  Project01Tests.swift
//  Project01Tests
//
//  Created by Joao Gripp on 03/08/22.
//

import XCTest
@testable import Project01

class Project01Tests: XCTestCase {

    func testLoadingImages() {
//        given
        let sut = ViewController()
        
//        when
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.pictures.count, 10, "There should be ten pictures.")
    }
    
    func testTableExists() {
//        given
        let sut = ViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasCorrectRowCount() {
//        given
        let sut = ViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        then
        let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.pictures.count)
    }
    
    func testEachCellHasTheCorrectText() {
//        given
        let sut = ViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        for (index, picture) in sut.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func testCellsHaveDisclosureIndicators() {
//        given
        let sut = ViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        for index in sut.pictures.indices {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testViewControllerUsesLargeTitles() {
//        given
        let sut = ViewController()
        _ = UINavigationController(rootViewController: sut)
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertTrue(sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
        
    }
    
    func testNavigationBarHasStormViewerTitle() {
//        given
        let sut = ViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.title, "Storm Viewer")
    }

}
