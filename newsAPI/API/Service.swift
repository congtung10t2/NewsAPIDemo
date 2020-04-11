//
//  Service.swift
//  newsAPI
//
//  Created by tùng hoàng on 4/10/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

public typealias APICompletion<T> = (_ data: T?, _ error: Error?) -> Void

class Service : ObservableObject {
  var feeds : [Article] = [] {
    willSet {
      objectWillChange.send()
    }
  }
  var didChange = PassthroughSubject<Void, Never>()
  let APIKey = "e9f9b296fc8f4a4388bd5b88b4556473"
  var url = "http://newsapi.org/v2/"
  init() {
    
  }
  func headlines(countryCode: String){
    let path = "top-headlines"
    let param = ["country": countryCode, "apiKey": APIKey]
    AF.request(url + path, parameters: param).responseJSON { response in
      let decoder = JSONDecoder()
      do {
        let rssFeed = try! decoder.decode(Response.self, from: response.data!)
        print(rssFeed)
        self.feeds = rssFeed.articles!

      } catch {
        print(error)
      
      }
      
      
    }
  }
  
}

struct Service_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
