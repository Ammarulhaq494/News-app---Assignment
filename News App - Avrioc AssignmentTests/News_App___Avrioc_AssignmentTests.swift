//___FILEHEADER___

import XCTest
@testable import News_App___Avrioc_Assignment

final class News_App___Avrioc_Assignment: XCTestCase {
    
    var mainViewController: ViewController!
    var detailViewController: DetailViewController!
    var newsViewModel: NewsViewModel!

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? ViewController
                detailViewController = storyboard.instantiateViewController(withIdentifier: "detail") as? DetailViewController
        newsViewModel = NewsViewModel()
        
    }

    override func tearDownWithError() throws {
        mainViewController = nil
        detailViewController = nil
        newsViewModel = nil
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
    
    func testMainViewController() {
            // Load the main view controller
            mainViewController.loadViewIfNeeded()
            // Test the table view delegate and data source
            XCTAssertNotNil(mainViewController.tableviewNews.delegate)
            XCTAssertNotNil(mainViewController.tableviewNews.dataSource)
        }
    
    func testNewsViewModel() {
          // Test the view model's data loading
          let expectation = XCTestExpectation(description: "News data loaded")
          newsViewModel.loadNews()
         
        newsViewModel.eventHandler = { [weak self] event in
            switch event {
            case .dataLoaded:
                XCTAssertGreaterThan(self!.newsViewModel.news.count, 0)
            case .error(let error):
                XCTFail("Error loading news: \(error!.localizedDescription)")
            case .loading:
                print("loading")
            case .stopLoading:
                print("stop loading")
            }
            
            expectation.fulfill()
        }
        
          
          wait(for: [expectation], timeout: 6)
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
