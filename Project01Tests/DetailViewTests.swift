//
//  DetailViewTests.swift
//  Project01Tests
//
//  Created by Joao Gripp on 04/08/22.
//

import XCTest
import UIKit
@testable import Project01

class DetailViewTests: XCTestCase {

    func testDetailImageViewExists() {
//        given
        let sut = DetailViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView() {
//        given
        let sut = DetailViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailViewImageViewBackgroundIsWhite() {
//        given
        let sut = DetailViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.imageView.backgroundColor, .white)
    }
    
    func testDetailViewImageViewIsScaleAspectFit() {
//        given
        let sut = DetailViewController()
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.imageView.contentMode, .scaleAspectFit)
    }
    
    func testDetailLoadsImage() {
//        given
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    func testSelectingImageShowsDetail() {
//        given
        let sut = ViewController()
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
//        When
        sut.pictureSelectAction = {
            selectedImage = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
//        Then
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }
    
    func testSelectingImageShowsDetailImage() {
//        given
        let sut = ViewController()
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
    
//        When
        sut.pictureSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()
            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
    }

}
