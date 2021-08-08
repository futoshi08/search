//
//  Owner.swift
//  app2021
//
//  Created by futoshi on 2021/05/12.
//

import Foundation

struct Owner: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
    }
}
