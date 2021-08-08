//
//  APIError.swift
//  app2021
//
//  Created by futoshi on 2021/04/30.
//

import Foundation

enum APIError : Error,LocalizedError {
    case dataNotFound
    case parseError
    
    var errorDescription: String? {
        switch self {
        case .dataNotFound:
            return "リポジトリが見つかりませんでした"
        case .parseError:
            return "不正なデータが検知されました"
        }
    }
}


