//
//  Article.swift
//  newsAPI
//
//  Created by tùng hoàng on 4/10/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import Foundation
class Article : Codable {
  var source: Source?
  var author: String!
  var title: String!
  var description: String!
  var url: String!
  var urlToImage: String!
  var publishedAt: String!
  var content: String!
}
class Source: Codable {
  var id: String?
  var name: String?
}

class Response: Codable {
  var status: String?
  var totalResults: Int?
  var articles: [Article?]?
}
