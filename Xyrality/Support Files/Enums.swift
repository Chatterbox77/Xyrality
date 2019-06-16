//
//  Enums.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import Foundation
enum DownloadError:Error,LocalizedError{
    case requestError
    case parseError
    public var errorDescription: String? {
        switch self {
        case .requestError:
            return NSLocalizedString("The error occured while making POST request", comment: "")
        case .parseError:
            return NSLocalizedString("The error occured while parsing data", comment: "")
        }
    }
}
