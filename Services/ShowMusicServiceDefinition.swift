//
//  ShowMusicServiceDefinition.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import Foundation
import Moya

// MARK: Constants

let apiURL = URL(string: "https://hes75mx2r3.execute-api.eu-central-1.amazonaws.com/prod/")!

// MARK: - Service Definition

enum ShowMusicServiceDefinition {
    case library
}

// MARK: - TargetType Protocol Implementation

extension ShowMusicServiceDefinition: TargetType {
    var baseURL: URL {
        return apiURL
    }
    var path: String {
        switch self {
        case .library:
            return "library"
        }
    }
    var method: Moya.Method {
        switch self {
        case .library:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    var task: Task {
        switch self {
        case .library:
            return .requestPlain
        }
    }
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
}
