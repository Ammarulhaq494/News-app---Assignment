//
//  NewsViewModel.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import Foundation
import Kingfisher
import UIKit


class NewsViewModel
{
    var news:[Artical] = []
    var eventHandler:((_ event:Event)->Void)?
    
    func noOfSections() -> Int
    {
        return 1
    }
    
    func nooOfRows(in section:Int) -> Int
    {
        return news.count
    }
    
    func loadNews()
    {
        self.eventHandler?(.loading)
        ApiCaller.getNews { result in
            self.eventHandler?(.stopLoading)
            switch result
            {
            case .success(let data):
                self.news = data.results
                self.eventHandler?(.dataLoaded)
            case.failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
    
}

extension NewsViewModel
{
    //Enum for databinding
    enum Event
    {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    
    
}


extension UIImageView
{
    func setImage(with urlString:String)
    {
        guard let url = URL.init(string: urlString) else
        {
            return
        }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
    
}
