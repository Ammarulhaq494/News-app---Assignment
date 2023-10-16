//
//  NewsModel.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import Foundation

//Codable class to map json respone to this model class
struct NewsModel: Codable
{
    let status:String
    let results:[Artical]
    
}

struct Artical:Codable
{
    let published_date:String?
    let byline:String?
    let title:String?
    let abstract:String?
    let media:[Media]?
    
}

struct Media:Codable
{
    let type:String?
    let subtype:String?
    let mediaMetaData:[MediaMetadata]?
    
    private enum CodingKeys: String, CodingKey {
           case type
           case subtype
           case mediaMetaData = "media-metadata"
           
       }
}

struct MediaMetadata:Codable
{
    let url:String?
    let height:Int?
    let width:Int?
}

