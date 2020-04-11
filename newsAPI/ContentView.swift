//
//  ContentView.swift
//  newsAPI
//
//  Created by tùng hoàng on 4/10/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import SwiftUI
import Combine
struct ContentView: View {
    @ObservedObject var service: Service
    var body: some View {
      VStack(alignment: .leading) {
        List(service.feeds) { feed in
          Text(feed.title)
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
      
      ContentView(service: Service())
    
    }
}
