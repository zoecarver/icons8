//
//  Icons.swift
//  icons8-mac
//
//  Created by Zoe IAMZOE.io on 8/23/18.
//  Copyright © 2018 Zoe IAMZOE.io. All rights reserved.
//

import AppKit

public func icon(named name: icons8) -> NSImage {
    let bundle = Bundle(identifier: "com.zoecarver.icons8")
    return bundle?.image(forResource: NSImage.Name(name.rawValue)) ?? NSImage()
}
