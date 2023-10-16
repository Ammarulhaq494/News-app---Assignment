//___FILEHEADER___

import XCTest
@testable import News_App___Avrioc_Assignment

final class News_App___Avrioc_Assignment: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDetailViewModel() throws
    {
        let metaData = MediaMetadata.init(url: "https://static01.nyt.com/images/2023/10/13/multimedia/13iran-kgjv/13iran-kgjv-thumbStandard.jpg", height: 240, width: 240)
        let metaData1 = MediaMetadata.init(url: "https://static01.nyt.com/images/2023/10/13/multimedia/13iran-kgjv/13iran-kgjv-thumbStandard.jpg", height: 240, width: 240)
        let metaData2 = MediaMetadata.init(url: "https://static01.nyt.com/images/2023/10/13/multimedia/13iran-kgjv/13iran-kgjv-thumbStandard.jpg", height: 240, width: 240)
        let mediaMetaDataArray = [metaData,metaData1,metaData2]
        let media = Media.init(type: "image", subtype: "photo", mediaMetaData: mediaMetaDataArray)
        let mediaArray = [media]
        let artical = Artical(published_date: "2023-10-13", byline: "By Patrick", title: "The Secrets of Hamas", abstract: "The Secrets of Hamas success in terror", media: mediaArray)
        let detail = NewsDetailViewModel(artical: artical)
        
        XCTAssertEqual(artical.abstract,detail.description)
        XCTAssertEqual(artical.media![0].mediaMetaData![2].url,detail.articalImage)
        
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
