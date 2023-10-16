//
//  ApiCaller.swift
//  News App - Avrioc Assignment
//
//  Created by Ammar Ul Haq on 14/10/2023.
//

import Foundation

class ApiCaller
{
    static func getNews(completionHandler:@escaping(_ result:Result<NewsModel,Error>)-> Void )
    {
        guard let url = URL(string:"\(NetworkConstant.shared.baseUrl)api-key=\(NetworkConstant.shared.apiKey)") else {
              let error = NSError(domain: "Invalid URL", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completionHandler(.failure(error))
              return
          }

          let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
              if let error = error {
                  completionHandler(.failure(error))
                  return
              }

              guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                  let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                  let errorDescription = HTTPURLResponse.localizedString(forStatusCode: statusCode)
                  let error = NSError(domain: "Bad Request", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorDescription])
                  completionHandler(.failure(error))
                  return
              }

              if let data = data {
                  let resultData = try? JSONDecoder().decode(NewsModel.self, from: data)
                  completionHandler(.success(resultData!))
              } else {
                  let error = NSError(domain: "Nil Response from Server", code: 500, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                  completionHandler(.failure(error))
              }
          }

          task.resume()
    }
    
}
