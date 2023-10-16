//
//  NewsDetailViewModel.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 15/10/2023.
//

import Foundation

class NewsDetailViewModel
{
    var artical: Artical
    var articalImage:String?
    var description:String?
    
    init(artical: Artical) {
        self.artical = artical
        self.articalImage = artical.media![0].mediaMetaData![2].url!
        self.description = artical.abstract ?? ""
    }
    
    
}
