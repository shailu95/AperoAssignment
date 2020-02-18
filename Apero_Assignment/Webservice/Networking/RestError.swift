//
//  RestError.swift
//  Apero_Assignment
//
//  Created by Shailendra vishwakarma on 17/02/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import UIKit

public struct ERROR_MSG {
    
    static let Unknown = "Unknown error occurred."
    static let Wrong = "Something went wrong."
    static let TimeOut = "Time Out."
}

class RestError: Error {
    
    public var code: Int = -1
    public var message: String = ERROR_MSG.Unknown
    
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}


