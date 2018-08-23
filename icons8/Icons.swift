//
//  Icons.swift
//  icons8
//
//  Created by Zoe IAMZOE.io on 8/8/18.
//  Copyright © 2018 Zoe IAMZOE.io. All rights reserved.
//

import UIKit

public func icon(named name: icons8) -> UIImage {
    return UIImage(named: name.rawValue, in: Bundle(identifier: "com.zoecarver.icons8"), compatibleWith: nil) ?? UIImage()
}
