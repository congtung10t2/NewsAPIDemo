//
//  Service.swift
//  newsAPI
//
//  Created by tùng hoàng on 4/10/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import Foundation
import Alamofire
public typealias APICompletion<T> = (_ data: T?, _ error: Error?) -> Void

class Service {
  let APIKey = "e9f9b296fc8f4a4388bd5b88b4556473"
  var url = "http://newsapi.org/v2/"
  init() {
    
  }
  func headlines(countryCode: String, completion: @escaping APICompletion<Data>){
    let path = "top-headlines"
    let param = ["country": countryCode, "apiKey": APIKey]
    AF.request(url + path, parameters: param).responseJSON { response in
      
      
      let decoder = JSONDecoder()
      let rssFeed = try! decoder.decode(Response.self, from: response.data!)
      print(rssFeed)
    }
  }
  
}
