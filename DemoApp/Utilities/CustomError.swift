//
//  ErrorCodes.swift
//  DemoApp
//
//  Created by Sheshnath Kumar on 02/01/19.
//  Copyright © 2019 ProMobi Technologies. All rights reserved.
//

import Foundation


enum ErrorCodes: Int {
    case unknownError
    case invalidUserId
    case invalidPassword
}


protocol DemoAppErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

struct CustomError: DemoAppErrorProtocol {
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    private var _description: String
    init(title: String?, description: String, code: ErrorCodes) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code.rawValue
    }
}
