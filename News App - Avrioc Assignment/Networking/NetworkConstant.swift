//
//  NetworkConstant.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import Foundation

class NetworkConstant
{
    public static var shared : NetworkConstant = NetworkConstant()
    
    public var apiKey: String
    {
        get
        {
            // Api key got from Newyork times dev portal
            return "zGWdNbgNngnDJgdtv90KNTGbT0fLeoXa"
        }
    }
    
    public var baseUrl: String
    {
        get
        {
            //Base URL to get news from api in json format
            return "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?"
        }
    }
}
