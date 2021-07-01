//
//  Network.swift
//  SampleClientiOS
//
//  Created by 민성홍 on 2021/06/30.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://10.254.110.76:4000/api")!)
}

